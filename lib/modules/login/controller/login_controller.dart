import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/user/user.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/widget/popup/custom_popup.dart';

class LoginController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  // RxBool isLoginSms = false.obs;
  RxBool isRegister = false.obs;

  RxBool isHidePassword = true.obs;
  RxBool isHideRePassword = true.obs;

  void doHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  void doHideRePassword() {
    isHideRePassword.value = !isHideRePassword.value;
  }

  void onTapRegister() async {
    isRegister.value = !isRegister.value;
    isHidePassword.value = true;
    isHideRePassword.value = true;
    txtName.clear();
    txtEmail.clear();
    txtPhone.clear();
    txtPassword.clear();
    txtRePassword.clear();
  }

  /// Login base on type user chose
  Future<void> doLogin() async {
    //   /// Login with password
    //   if (!isLoginSms.value) {
    //     await doLoginWithPassword();
    //     return;
    //   }
    //
    //   /// Login with sms
    //   await doLoginWithOTP();
  }

  /// Register base on type user chose
  Future<void> doRegister() async {
    if (txtEmail.text == '' ||
        txtPhone.text == '' ||
        txtName.text == '' ||
        txtPassword.text == '' ||
        txtRePassword.text == '') {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Thông tin đang bị để trống. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    if (txtPassword.text != txtRePassword.text) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Mật khẩu chưa trùng khớp. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    await EasyLoading.show();
    bool status = await CallAPIUser.register(
        fullName: txtName.text,
        phone: txtPhone.text,
        email: txtEmail.text,
        username: txtEmail.text,
        password: txtPassword.text,
        rePassword: txtRePassword.text);
    await EasyLoading.dismiss();
    if (!status) return;

    Get.toNamed(Routes.STEP1REGISTER);
  }

  /// Forget password
Future<void> doForgetPassword() async {
    Get.toNamed(Routes.FORGOTPASSWORD);
  // Get.toNamed(Routes.VERIFYOTP,
  //     arguments: {'phone': txtPhone.text, 'type': 2});
}

  /// isLoginSms = false -> User chose login with password
// Future<void> doLoginWithPassword() async {
//   if (!Utils.validatePhone(phone: txtPhone.text)) return;
//   await CustomEasyLoading.loadingLoad();
//
//   await Future.delayed(const Duration(seconds: 2));
//
//   await CustomEasyLoading.stopLoading();
//   Get.toNamed(Routes.MAIN);
// }
//

  /// isLoginSms = true -> User chose login with Sms-Otp
// Future<void> doLoginWithOTP() async {
//   if (!Utils.validatePhone(phone: txtPhone.text)) return;
//   await CustomEasyLoading.loadingLoad();
//
//   await Future.delayed(const Duration(seconds: 2));
//
//   await CustomEasyLoading.stopLoading();
//   Get.toNamed(Routes.VERIFYOTP,
//       arguments: {'phone': txtPhone.text, 'type': 3});
// }
//
// // /// Check biometricStatus = true
// // /// Auto call to login
// // void doLoginWithBiometric() async{
// //   txtPhone.text = AppDataGlobal.user.phone ?? '';
// //
// //   if(!AppDataGlobal.biometricStatus.value) return;
// //
// //   bool status = await LocalAuth.showAuth(localizedReason: 'Xin hãy xác thực để đăng nhập hệ thống');
// //
// //   if(!status) return;
// //
// //   txtPassword.text = AppDataGlobal.user.password ?? '';
// //
// //   doLoginWithPassword();
// // }
}
