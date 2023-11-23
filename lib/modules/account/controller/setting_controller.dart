import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/stored/shared_preferences/set.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';
import '../../../model/post/post_list_joining.dart';
import '../../../model/post/post_list_posted.dart';
import '../../../utils/call_api/post/call_api_post.dart';
import '../../../utils/language.dart';

class AccountController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> doCreateAccount(BuildContext context) async {
    await CustomLanguage.doChange();
  }

  void onTapProfile() async {
    Get.toNamed(Routes.PROFILE);
  }

  void onTapWallet() {
    Get.toNamed(Routes.WALLET);
  }

  void onTapPostedPost() async {
    await EasyLoading.show();

    List<PostedPostDataModel> list = await CallAPIPost.getPostedPosts();

    await EasyLoading.dismiss();

    if (list.isEmpty) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Bạn chưa đăng bài viết nào. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.POSTEDPOST, arguments: {'data': list});
  }

  void onTapManageJoiningPost() async {
    await EasyLoading.show();

    List<JoinedPostDataModel> list = await CallAPIPost.getJoiningPosts();

    await EasyLoading.dismiss();

    if (list.isEmpty) return;

    Get.toNamed(Routes.JOININGPOST, arguments: {'data': list});
  }

  void onTapSetting() async {
    Get.toNamed(Routes.CHANGEPASSWORD, arguments: {"type": 1});
  }

  void onTapLogout() async {
    await CustomPopup.showWithAction(Get.context,
        title: "Đăng xuất",
        message: "Bạn chắc chắn muốn đăng xuất chứ?",
        titleButtonLeft: "Suy nghĩ lại",
        titleButtonRight: "Có", onTapRight: () {
      SetDataToLocal.clearAll();
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}
