import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/post/call_api_post.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/date_range_picker/date_range_picker_custom.dart';
import 'package:vbmsports/utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';
import 'package:vbmsports/utils/widget/time_picker/time_picker.dart';

import '../../../model/location/location_model.dart';
import '../../../utils/call_api/location/call_api_location.dart';
import '../../../utils/common/data.dart';

class CreatePostController extends GetxController {
  TextEditingController txtTitlePost = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  RxList<XFile> imageUploadList = RxList<XFile>();

  RxList<DateTime> dateRangeSelected = RxList.empty(growable: true);

  RxList<SlotInfo> dateOfWeekSelected = RxList.empty(growable: true);

  // levelSlot: 'Sơ cấp',
  // categorySlot: 'Đánh đơn',

  List<String> listLevelSlot = ['Sơ cấp', 'Trung cấp', 'Cao cấp'];
  List<String> listCategorySlot = ['Đánh đơn', 'Đánh đôi', 'Hỗn hợp'];

  Rx<LocationDataModel> province = LocationDataModel().obs;
  Rx<LocationDataModel> ward = LocationDataModel().obs;

  RxList<LocationDataModel> listProvinces = RxList.empty(growable: true);
  RxList<LocationDataModel> listDistricts = RxList.empty(growable: true);

  RxString levelSlotSelected = RxString('');
  RxString categorySlotSelected = RxString('');

  @override
  void onInit() {
    unawaited(getProvinces());
    super.onInit();
  }

  int findIndexDateOfWeekSelected(SlotInfo date) {
    return dateOfWeekSelected.indexOf(date);
  }

  int autoAddMinute(int minute) {
    if (minute > 0 && minute < 15) {
      return 15 - minute;
    } else if (minute > 15 && minute < 30) {
      return 30 - minute;
    } else if (minute > 30 && minute < 45) {
      return 45 - minute;
    } else if (minute > 45 && minute < 60) {
      return 60 - minute;
    }
    return 0;
  }

  Future<void> doOpenGallery() async {
    if (imageUploadList.length == AppDataGlobal.maxImageUpload) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Bạn chỉ được upload tối đa 4 tấm ảnh',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.back();
    final List<XFile> pickedFile = await _picker.pickMultiImage();
    for (int i = 0; i < pickedFile.length; i++) {
      if (isImageUploadLimitReached()) {
        break;
      }
      imageUploadList.add(pickedFile[i]);
    }
  }

  bool isImageUploadLimitReached() {
    return imageUploadList.length - AppDataGlobal.maxImageUpload >= 0;
  }

  void removeUploadedImage(int index) {
    imageUploadList.removeAt(index);
  }

  void onTapTimePicker(SlotInfo date) async {
    await CommonModalBottomSheet.show(
        isDismissible: false,
        maxHeight: 300,
        customWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: TimePickerCustom(date: date),
        ));
  }

  void onTapDatePicker() async {
    await CommonModalBottomSheet.show(
        isDismissible: true,
        maxHeight: 400,
        customWidget: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: DateRangePickerCustom(),
        ));
  }

  void onTapConfirm() async {
    if (txtTitlePost.text == '' ||
        txtAddress.text == '' ||
        txtDescription.text == '' ||
        dateOfWeekSelected.isEmpty ||
        imageUploadList.isEmpty ||
        categorySlotSelected.value == '' ||
        levelSlotSelected.value == '' ||
        province.value.name == null ||
        ward.value.name == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Vui lòng nhập đầy đủ thông tin',
          titleButton: 'Đã hiểu');
      return;
    }

    List<SlotInfo> listDayOfWeekError = dateOfWeekSelected
        .where((value) =>
            value.availableSlot == null ||
            value.availableSlot == -1 ||
            value.price == null ||
            value.price == -1 ||
            value.price == 0 ||
            value.startTime == null ||
            value.endTime == null)
        .toList();

    if (listDayOfWeekError.isNotEmpty) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message:
              '${Utils.convertDateTime(date: listDayOfWeekError.first.startTime.toString(), dateFormat: 'dd/MM/yyyy')} thông tin slot, giá, giờ chơi của bạn đăng có vấn đề',
          titleButton: 'Đã hiểu');
      return;
    }

    List<String> imgUrls = [];

    for (var element in imageUploadList) {
      imgUrls.add(Utils.convertFileToBase64(element.path));
    }

    /// tới đây là call api tạo bài viết
    await EasyLoading.show();
    bool status = await CallAPIPost.createPost(
        levelSlot: levelSlotSelected.value,
        categorySlot: categorySlotSelected.value,
        title: txtTitlePost.text,
        address:
            '${txtAddress.text}, ${ward.value.name}, ${province.value.name}',
        slots: dateOfWeekSelected,
        description: txtDescription.text,
        imgUrls: imgUrls,
        highlightUrl: Utils.convertFileToBase64(imageUploadList.first.path));
    await EasyLoading.dismiss();
    if (!status) return;

    Get.offAllNamed(Routes.MAIN);
    await CustomPopup.showAnimationWithAction(Get.context,
        message: 'Tạo bài viết thành công',
        animationUrl: AssetAnimationCustom.paymentSuccessed,
        titleButton: 'Đã hiểu');
  }

  void onTapSelectDayOfWeek(DateTime date) {
    bool status = isSelectedDayOfWeek(date);

    if (status) {
      removeSelectedDayOfWeek(date);
      return;
    }

    dateOfWeekSelected.add(SlotInfo(startTime: date.toString()));
  }

  void removeSelectedDayOfWeek(DateTime date) {
    List<SlotInfo> list = dateOfWeekSelected
        .where((value) => value.startTime == date.toString())
        .toList();

    dateOfWeekSelected.remove(list.first);
  }

  Future<void> addSlotSelectedDayOfWeek(
      {required SlotInfo data, required int slot}) async {
    int index = findIndexDateOfWeekSelected(data);

    dateOfWeekSelected.elementAt(index).availableSlot = slot;
    dateOfWeekSelected.refresh();
  }

  Future<void> addPriceSelectedDayOfWeek(
      {required SlotInfo data, required int price}) async {
    int index = findIndexDateOfWeekSelected(data);

    dateOfWeekSelected.elementAt(index).price = price;
    dateOfWeekSelected.refresh();
  }

  Future<void> addStartEndSelectedDayOfWeek(
      {required SlotInfo data,
      required String startTime,
      required String endTime}) async {
    int index = findIndexDateOfWeekSelected(data);
    String date = Utils.convertDateTime(
        date: dateOfWeekSelected.elementAt(index).startTime ?? '',
        dateFormat: 'yyyy-MM-dd');
    dateOfWeekSelected.elementAt(index).startTime = '$date $startTime:00';
    dateOfWeekSelected.elementAt(index).endTime = '$date $endTime:00';
    dateOfWeekSelected.refresh();
  }

  bool isSelectedDayOfWeek(DateTime date) {
    try {
      List<SlotInfo> list = dateOfWeekSelected
          .where((value) =>
              Utils.convertDateTime(
                  date: value.startTime!, dateFormat: 'dd/MM/yyyy') ==
              Utils.convertDateTime(
                  date: date.toString(), dateFormat: 'dd/MM/yyyy'))
          .toList();
      return list.isNotEmpty;
    } catch (e) {
      return true;
    }
  }

  void onTapLocation({required bool isProvince}) async {
    if (isProvince) {
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
                      margin:
                          const EdgeInsets.only(top: 16, left: 12, right: 12),
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
      // getProvinces();
      return;
    }
    if (province.value.id == '' || province.value.id == null) {
      CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Vui lòng chọn Tỉnh/Thành phố trước',
          titleButton: 'Đã hiểu');
      return;
    }

    await getDistricts('${province.value.id}');
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
                              color: (element.id == ward.value.id &&
                                      (ward.value != null))
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
      if (listDistricts.isNotEmpty) return;

      await EasyLoading.show();
      listDistricts.value = await CallAPILocation.getDistrict(keyProvince: id);
    } finally {
      await EasyLoading.dismiss();
    }
  }

  void onTapChooseProvince(LocationDataModel data) {
    if (data.id == province.value.id && (province.value != null)) {
      Get.back();
      return;
    }

    listDistricts.clear();
    ward.value = LocationDataModel();
    province.value = data;
    Get.back();
  }

  void onTapChooseWard(LocationDataModel data) {
    if (data.id == ward.value.id && (ward.value != null)) {
      Get.back();
      return;
    }

    ward.value = data;
    Get.back();
  }
}
