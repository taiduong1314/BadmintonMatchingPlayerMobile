part of 'login_screen.dart';

extension BodyCustom on LoginScreen {
  Widget _body() {
    return Obx(
      () => Container(
        width: Get.width,
        constraints: BoxConstraints(maxHeight: Get.height / 1.3),
        padding: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: SingleChildScrollView(
          child:
              controller.isRegister.value ? _widgetRegister() : _widgetLogin(),
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

  Widget _btnLoginVsRegister() {
    return GestureDetector(
      onTap: () async => controller.isRegister.value
          ? await controller.doRegister()
          : await controller.doLogin(),
      child: CustomButton.commonButton(
        height: 58,
        title: controller.isRegister.value ? 'Đăng ký' : 'Đăng nhập',
      ),
    );
  }

  Widget _btnForgotPassVsRegisterTextOnly(
      {required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CustomText.textPlusJakarta(
          text: title, style: TextAppStyle.bodySmall()),
    );
  }
}
