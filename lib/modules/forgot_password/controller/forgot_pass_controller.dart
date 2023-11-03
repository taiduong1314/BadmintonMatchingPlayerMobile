import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
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

  Future<void> checkOtp() async {
    if (!Utils.validateOTP(txtOTP)) return;
  }

  void doHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  void doHideRePassword() {
    isHideRePassword.value = !isHideRePassword.value;
  }

  void onTapInputEmail() {
    indexFlow.value = 1;
  }

  void onTapOtpVerify() {
    indexFlow.value = 2;
  }

  void onTapResendOTP() {}

  void onTapInputNewPassword() {
    if (txtPassword.text.trim() != txtRePassword.text.trim()) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Mật khẩu chưa trùng khớp. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

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
