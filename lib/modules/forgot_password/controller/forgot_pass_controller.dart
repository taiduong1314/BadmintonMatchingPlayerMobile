import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/otp/verify_otp.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/otp/call_api_otp.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';
import 'package:vbmsports/utils/common/asset/svg.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../utils/utils.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController txtEmail = TextEditingController();

  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  RxInt indexFlow = 0.obs;

  RxBool isHidePassword = true.obs;
  RxBool isHideRePassword = true.obs;

  String txtOTP = '';

  void doHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  void doHideRePassword() {
    isHideRePassword.value = !isHideRePassword.value;
  }

  void onTapInputEmail() async {
    if (txtEmail.text.isEmpty) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Email đang để trống, vui lòng điền email.',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    await EasyLoading.show();

    var status = await CallAPIOTP.send(email: txtEmail.text);

    await EasyLoading.dismiss();

    if(!status) return;


    indexFlow.value = 1;
  }

  void onTapOtpVerify() async {
    await EasyLoading.show();
    var statusCheckToken = await CallAPIOTP.check(email: txtEmail.text, verifyToken: txtOTP);
    await EasyLoading.dismiss();

    if (!Utils.validateOTP(txtOTP) || statusCheckToken != true) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Mã OTP không chính xác, vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    indexFlow.value = 2;
  }

  void onTapResendOTP() async {
    var status = await CallAPIOTP.send(email: txtEmail.text);


    if (status != true) return;

    CustomPopup.showSnackBar(
        title: 'Thông báo', message: "Mã OTP đã được gửi thành công");
  }

  void onTapInputNewPassword() async {
    if (txtPassword.text.isEmpty || txtRePassword.text.isEmpty) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Mật khẩu không được để trống. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    if (txtPassword.text.trim() != txtRePassword.text.trim()) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Mật khẩu chưa trùng khớp. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    await EasyLoading.show();

    bool status = await CallAPIUser.forgotPassword(
        email: txtEmail.text,
        password: txtPassword.text,
        rePassword: txtRePassword.text);

    await EasyLoading.dismiss();

    if (!status) return;

    CustomPopup.showTextWithImage(Get.context,
        title: 'Đổi mật khẩu thành công',
        message: 'Bạn đã đổi mật khẩu thành công',
        titleButton: 'Đăng Nhập Ngay',
        titleUnderImage: true,
        heightSvg: 70,
        widthSvg: 70,
        svgUrl: AssetSVGName.successful,
        onTap: () => Get.offAllNamed(Routes.LOGIN));
  }

  void onTapBack() {
    switch (indexFlow.value) {
      case 0:
        Get.back();
        break;
      case 1:
        indexFlow.value = 0;
      case 2:
        indexFlow.value = 1;
    }
  }
}
