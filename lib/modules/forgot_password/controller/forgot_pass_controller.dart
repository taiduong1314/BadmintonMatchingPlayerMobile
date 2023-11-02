import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/common/asset/svg.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController txtEmail = TextEditingController();

  RxInt indexFlow = 0.obs;

  void onTapInputEmail() {
    indexFlow.value = 1;
  }

  void onTapOtpVerify() {
    indexFlow.value = 2;
  }

  void onTapInputNewPassword() {
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
}
