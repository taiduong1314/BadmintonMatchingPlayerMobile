import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../../../utils/utils.dart';
import '../../../utils/call_api/user/call_api_user.dart';
import '../../../utils/common/key_data_local.dart';
import '../../../utils/stored/shared_preferences/get.dart';

class AccountChangePasswordController extends GetxController {
  RxBool isHideOldPassword = false.obs;
  RxBool isHidePassword = false.obs;
  RxBool isHideConfirmPassword = false.obs;
  TextEditingController txtOldPassword = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  // // Check status rule input password
  // RxBool isContainUpperCase = false.obs;
  // RxBool isMinLength = false.obs;
  // RxBool isContainSpecialCharacter = false.obs;
  // RxBool isAcceptServiceRule = false.obs;

  //error text
  // RxString errorText = ''.obs;
  RxBool isSubmitted = false.obs;

  RxBool isShowSuccessedAnimation = false.obs;

  void doChangeTypeOldPassword() {
    isHideOldPassword.value = !isHideOldPassword.value;
  }

  void doChangeTypePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  void doChangeTypeConfirmPassword() {
    isHideConfirmPassword.value = !isHideConfirmPassword.value;
  }

  ///Click to navigate to web view to read the service rule of Thaco App
  void doReadRule() {}

  Future<bool> onTapConfirmPasswordButton() async {
    final String password =
        await GetDataFromLocal.getString(key: KeyDataLocal.passwordKey);

    // errorText.value = '';
    if (txtPassword.text.isEmpty ||
        txtOldPassword.text.isEmpty ||
        txtConfirmPassword.text.isEmpty) {
      doShowPopup('Mật khẩu không được để trống');
      return false;
    }

    bool compareStatusOldPassword = Utils.comparePassword(
        password: password, confirmPassword: txtOldPassword.text);

    if (!compareStatusOldPassword) {
      doShowPopup('Mật khẩu cũ không khớp, hãy kiểm tra và thử lại');
      return false;
    }

    bool compareStatusNewPassword = Utils.comparePassword(
        password: txtPassword.text, confirmPassword: txtConfirmPassword.text);
    if (!compareStatusNewPassword) {
      doShowPopup('Mật khẩu nhập lại không khớp, hãy kiểm tra và thử lại');
      return false;
    }

    if (password == txtOldPassword.text &&
        txtOldPassword.text == txtPassword.text) {
      doShowPopup('Mật khẩu mới không được trùng mới mật khẩu cũ');
      return false;
    }
    isSubmitted.value = true;
    if (
        // isMinLength.value &&
        //     isContainSpecialCharacter.value &&
        //     isContainUpperCase.value &&
        compareStatusNewPassword) {
      return true;
    }
    return false;
  }

  void resetCheckErrorState() {
    isSubmitted.value = false;
  }

  void doActionTapConfirmPassword() async {
    if (!await onTapConfirmPasswordButton()) return;
    try {
      await EasyLoading.show();

      bool status = await CallAPIUser.changePassword(
          password: txtPassword.text, rePassword: txtConfirmPassword.text);

      if (!status) return;
      Get.back();
      await CustomPopup.showAnimationWithAction(Get.context,
          message: 'Mật khẩu của bạn đã được cập nhật',
          maxLineMessage: 2,
          titleButton: 'Đã hiểu',
          animationUrl: AssetAnimationCustom.paymentSuccessed);
    } finally {
      await EasyLoading.dismiss();
    }
  }

  void doShowPopup(message) async {
    await CustomPopup.showOnlyText(Get.context,
        title: 'Thông báo', message: message, titleButton: 'Đã hiểu');
  }
}
