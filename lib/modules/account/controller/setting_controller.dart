import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/stored/shared_preferences/set.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';
import '../../../utils/language.dart';

class AccountController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> doCreateAccount(BuildContext context) async {
    await CustomLanguage.doChange();
  }

  void onTapProfile() {}

  void onTapWallet() {
    Get.toNamed(Routes.WALLET);
  }

  void onTapPost() {}

  void onTapManagerPost() {}

  void onTapSetting() {}

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
