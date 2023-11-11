import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/stored/shared_preferences/set.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';
import '../../../utils/common/asset/animation.dart';
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
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }

  void onTapWallet() {
    Get.toNamed(Routes.WALLET);
  }

  void onTapPost() async {
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }

  void onTapManagerPost() async {
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }

  void onTapSetting() async {
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
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
