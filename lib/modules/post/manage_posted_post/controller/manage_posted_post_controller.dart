import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vbmsports/api/get/settings/setting.dart';
import 'package:vbmsports/api/put/post/boots_post.dart';
import 'package:vbmsports/api/put/post/delete_post.dart';
import 'package:vbmsports/model/common/bool_model.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import '../../../../model/post/post_list_posted.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/call_api/post/call_api_post.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class ManagePostedPostController extends GetxController {
  RxList<PostedPostDataModel> listPosts = RxList.empty(growable: true);
  Rx price = Rx<dynamic>(null);

  @override
  void onInit() {
    getPosts();
    getPrice();
    super.onInit();
  }

  void getPosts() {
    listPosts.value = Get.arguments['data'];
  }

  void getPrice() async {
    price.value = await CallApiSetting.get();
  }

  void reloadPost() async {
    listPosts.value = await CallAPIPost.getPostedPosts();
  }

  void onTapPost(PostedPostDataModel data) async {
    if (data.postId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy ID bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    await EasyLoading.show();
    var dataDetail = await CallAPIPost.getPostDetail(postID: data.postId!);
    await EasyLoading.dismiss();

    if (dataDetail.userId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy chi tiết bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.POSTDETAIL,
        arguments: {"data": dataDetail, "id": data.postId});
  }

  void deletePost(int postId) async {
    await CustomPopup.showWithAction(
      Get.context,
      title: 'Xóa bài viết',
      message: 'Bạn có thực sự muốn xóa bài viết',
      titleButtonLeft: 'Hủy',
      titleButtonRight: 'Xóa',
      onTapLeft: () {},
      onTapRight: () async {
        bool status = await CallAPIDeletePost.put(postId);
        if (status == true) {
          reloadPost();
        }
      },
    );
  }

  void bootsPost(int postId) async {
    var boostPostSetting = price.value['data'].firstWhere(
      (setting) => setting['settingName'] == 'boostPostFree',
      orElse: () => null,
    );
    double boostPostFreeAmount = boostPostSetting['settingAmount'];
    String formattedAmount =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
            .format(boostPostFreeAmount);
    await CustomPopup.showWithAction(
      Get.context,
      title: 'Đẩy bài viết',
      message: 'Bạn có muốn đẩy bài viết, Phí đẩy bài $formattedAmount',
      titleButtonLeft: 'Hủy',
      titleButtonRight: 'OK',
      onTapLeft: () {},
      onTapRight: () async {
        var status = await CallAPIBootsPost.put(postId);
        if (status.data != null) {
          await CustomPopup.showAnimationWithAction(
            Get.context,
            message: 'Đẩy bài viết thành công',
            animationUrl: AssetAnimationCustom.paymentSuccessed,
            titleButton: 'Đã hiểu',
          );
        } else {
          await CustomPopup.showAnimationWithTwoAction(
            Get.context,
            message: 'Số dư tài khoản không đủ, vui lòng nạp thêm tiền',
            animationUrl: AssetAnimationCustom.paymentFailed,
            titleButtonBottom: 'Đã hiểu',
            titleButtonTop: 'Nạp thêm tiền',
            onTapBottom: () {},
            onTapTop: () {
              Get.toNamed(Routes.DEPOSITVSWITHDRAW,
                  arguments: {'isDeposit': true});
            },
          );
        }
      },
    );
  }
}
