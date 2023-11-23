import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/user/user.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/set.dart';

import '../../../service/firebase/social_service/social_service.dart';
import '../../../utils/common/asset/animation.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/widget/popup/custom_popup.dart';

class LoginController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  String accessTokenSocial = '';

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
    if (txtEmail.text == '' || txtPassword.text == '') {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Thông tin đang bị để trống. Vui lòng nhập đầy đủ thông tin',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    await EasyLoading.show();
    UserDataModel data = await CallAPIUser.login(
        email: txtEmail.text, password: txtPassword.text);
    await EasyLoading.dismiss();

    if (data.token == null) return;

    AppDataGlobal.user.value = data;
    SetDataToLocal.setString(
        key: KeyDataLocal.userKey, data: userDataModelToJson(data));
    SetDataToLocal.setString(
        key: KeyDataLocal.usernameKey, data: txtEmail.text);
    SetDataToLocal.setString(
        key: KeyDataLocal.passwordKey, data: txtPassword.text);
    Get.offAllNamed(Routes.MAIN);
  }

  /// Login with social account
  /// type -> 0: google - 1: apple - 2 facebook
  Future<void> doLoginSocial({required int type}) async {
    try {
      // Tạm thời block login bằng apple và facebook
      if (type != 0) {
        await CustomPopup.showAnimationWithAction(Get.context,
            message: "Tính năng đang được phát triển vui lòng quay lại sau",
            titleButton: "Đã hiểu",
            maxLineMessage: 3,
            repeatAnimation: true,
            animationUrl: AssetAnimationCustom.crying);
        return;
      }
      await EasyLoading.show();
      UserCredential? data;
      if (type == 0) {
        // Login with Google
        data = await SocialServices.googleService.signInWithGoogle();
      } else if (type == 1) {
        // Login with Apple
        data = await SocialServices.appleService.signInWithApple();
      } else if (type == 2) {
        // Login with Facebook
        data = await SocialServices.facebookService.signInWithFacebook();
      }

      if (data == null) {
        await EasyLoading.dismiss();
        return;
      }

      /// Get token (JWT) to send BE
      await data.user?.getIdToken().then((value) {
        accessTokenSocial = value ?? '';
        if (kDebugMode) {
          print('=============== Social Token ===============');
          print(accessTokenSocial.substring(0, 400));
          print(accessTokenSocial.substring(400));
          print('=============================================');
        }
      });

      // If access token is empty
      // return, don't call api to login
      if (accessTokenSocial == '') {
        await EasyLoading.dismiss();
        return;
      }

      // var userData = await CallAPILogin.loginSocial(token: accessTokenSocial);

      await EasyLoading.dismiss();

      // if (userData?.token != null) {
      //   isSaveLogin.value = true;
      //   AppDataGlobal.userData.value = userData ?? LoginDataModel();
      //   AppDataGlobal.isFirstLogin.value = true;
      //   await CallAPIAccount.get();
      //   doSaveUserLogin();
      //   Get.offAllNamed(Routes.MAIN, arguments: {"index": -1});
      // }

      await CustomPopup.showTextWithImage(Get.context,
          title: 'Thông báo',
          message: 'Đăng nhập Google thành công - api chưa có',
          titleButton: 'Đã hiểu',
          titleUnderImage: true,
          heightSvg: 70,
          widthSvg: 70,
          svgUrl: AssetSVGName.successful);
    } catch (e) {
      await EasyLoading.dismiss();
      String serviceName = '';
      switch (type) {
        case 0:
          serviceName = 'googleService';
          break;
        case 1:
          serviceName = 'appleService';
          break;
        case 2:
          serviceName = 'facebookService';
          break;
      }
      if (kDebugMode) {
        print('SocialServices.$serviceName Error: $e');
      }
    }
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
  }
}
