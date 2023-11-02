part of 'forgot_pass_screen.dart';

extension BodyCustom on ForgotPasswordScreen {
  Widget _body() {
    return Obx(
      () => Container(
        width: Get.width,
        constraints: BoxConstraints(maxHeight: Get.height / 1.8),
        padding: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: SingleChildScrollView(
          child: controller.indexFlow.value == 0 // Nhập email
              ? _widgetForgotPass()
              : controller.indexFlow.value == 1 // Nhập otp
                  ? _widgetOtpVerify()
                  : _widgetResetPass(), // Nhập mật khẩu
        ),
      ),
    );
  }

  Widget _heading(title) {
    return Container(
        alignment: Alignment.centerLeft,
        width: Get.width,
        child:
            CustomText.textPlusJakarta(text: title, style: TextAppStyle.h3()));
  }

  Widget _subHeading(title) {
    return Container(
        alignment: Alignment.centerLeft,
        width: Get.width,
        child: CustomText.textPlusJakarta(
            text: title, style: TextAppStyle.bodySmall()));
  }
}
