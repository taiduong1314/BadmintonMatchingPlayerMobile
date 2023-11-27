import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/post/post_suggestion.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/post/call_api_post.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../model/location/location_model.dart';
import '../../../model/post/post_list_joining.dart';
import '../../../utils/call_api/location/call_api_location.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';

class HomeController extends GetxController {
  RxList<PostSuggestionDataModel> listPostSuggestion =
      RxList.empty(growable: true);

  RxBool isLoading = true.obs;

  RxList<LocationDataModel> listProvinces = RxList.empty(growable: true);
  RxList<LocationDataModel> listDistricts = RxList.empty(growable: true);

  Rx<LocationDataModel> province = LocationDataModel().obs;

  @override
  void onInit() {
    unawaited(getProvinces());
    handleInit();
    super.onInit();
  }

  void handleInit() async {
    await EasyLoading.show();
    listPostSuggestion.value = await CallAPIPost.getPostsSuggestion();

    try {
      var listYardsFull =
          listPostSuggestion.where((data) => data.quantitySlot == 0).toList();

      for (var element in listYardsFull) {
        listPostSuggestion.remove(element);
      }
    } catch (e) {}

    isLoading.value = false;
    await EasyLoading.dismiss();
  }

  void onTapPost(PostSuggestionDataModel data) async {
    if (data.idPost == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy ID bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    await EasyLoading.show();
    var dataDetail = await CallAPIPost.getPostDetail(postID: data.idPost!);
    await EasyLoading.dismiss();

    if (dataDetail.userId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy chi tiết bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.POSTDETAIL,
        arguments: {"data": dataDetail, 'id': data.idPost});
  }

  void onTapYardLike() async {
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }

  void onTapYardJoining() async {
    await EasyLoading.show();

    List<JoinedPostDataModel> list = await CallAPIPost.getJoiningPosts();

    await EasyLoading.dismiss();

    if (list.isEmpty) return;

    Get.toNamed(Routes.JOININGPOST, arguments: {'data': list});
  }

  void onTapViewAllYards() async {
    await EasyLoading.show();

    List<PostSuggestionDataModel> list = await CallAPIPost.getListPosts();

    await EasyLoading.dismiss();

    if (list.isEmpty) return;

    Get.toNamed(Routes.POSTS, arguments: {'data': list});
  }

  void onTapNotification() => Get.toNamed(Routes.NOTIFICATION);

  void onTapChooseLocation() async {
    await getProvinces();
    CommonModalBottomSheet.show(
        customWidget: ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32), topLeft: Radius.circular(32)),
      child: Column(
        children: [
          spaceVertical(height: 20),
          CustomText.textPlusJakarta(
              text: 'Tỉnh/Thành phố', style: TextAppStyle.h4()),
          spaceVertical(height: 20),
          SingleChildScrollView(
            child: Column(children: [
              ...listProvinces.map((element) {
                return GestureDetector(
                  onTap: () => onTapChooseProvince(element),
                  child: Container(
                    margin: const EdgeInsets.only(top: 16, left: 12, right: 12),
                    padding: const EdgeInsets.all(16),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: (element.id == province.value.id &&
                                    (province.value != null))
                                ? AppColor.colorButton
                                : AppColor.colorGrey300,
                            width: 0.6)),
                    child: CustomText.textPlusJakarta(
                        text: element.name ?? '', style: TextAppStyle.h6()),
                  ),
                );
              }).toList(),
              spaceVertical(height: AppDataGlobal.safeBottom + 20),
            ]),
          ),
        ],
      ),
    ));
  }

  Future<void> getProvinces() async {
    try {
      if (listProvinces.isNotEmpty) return;
      await EasyLoading.show();
      listProvinces.value = await CallAPILocation.getProvince();
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> getDistricts(String id) async {
    try {
      await EasyLoading.show();
      listDistricts.value = await CallAPILocation.getDistrict(keyProvince: id);
    } finally {
      await EasyLoading.dismiss();
    }
  }

  void onTapChooseProvince(LocationDataModel data) async {
    if (!(data.id == province.value.id && (province.value != null))) {
      await getDistricts('${data.id}');
    }

    province.value = data;
    CommonModalBottomSheet.show(
        customWidget: ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32), topLeft: Radius.circular(32)),
      child: Column(
        children: [
          spaceVertical(height: 20),
          CustomText.textPlusJakarta(
              text: 'Quận/Huyện', style: TextAppStyle.h4()),
          spaceVertical(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                ...listDistricts.map((element) {
                  return GestureDetector(
                    onTap: () => onTapChooseWard(element),
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 16, left: 12, right: 12),
                      padding: const EdgeInsets.all(16),
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColor.colorGrey300, width: 0.6)),
                      child: CustomText.textPlusJakarta(
                          text: element.name ?? '', style: TextAppStyle.h6()),
                    ),
                  );
                }).toList(),
                spaceVertical(height: AppDataGlobal.safeBottom + 20),
              ]),
            ),
          ),
        ],
      ),
    ));
  }

  void onTapChooseWard(LocationDataModel data) async{
    if(data.id == null) return;

    Get.back();
    Get.back();
    await EasyLoading.show();

    List<PostSuggestionDataModel> list = await CallAPIPost.getListPostsByPlayGround(wardID: data.id ?? 0);

    await EasyLoading.dismiss();

    if (list.isEmpty) return;

    list.forEach((element) {
      print('${element.toJson()}');
    });
    Get.toNamed(Routes.POSTS, arguments: {'data': list});
  }
}
