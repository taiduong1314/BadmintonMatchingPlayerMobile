part of 'login_screen.dart';

extension LoginCustom on LoginScreen {
  Widget _widgetLogin() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceVertical(height: 38),
        _heading('Xin chào bạn!'),
        spaceVertical(height: 8),
        _subHeading('Đăng nhập ngay'),
        spaceVertical(height: 38),
        _inputForm(
            title: "Email",
            controllerText: controller.txtEmail,
            hintText: "Nhập email của bạn"),
        spaceVertical(height: 18),
        _inputPasswordForm(
            title: "Mật khẩu",
            controllerText: controller.txtPassword,
            obscureText: controller.isHidePassword.value,
            onTap: controller.doHidePassword,
            hintText: "Nhập mật khẩu"),
        spaceVertical(height: 18),
        _btnLoginVsRegister(),
        spaceVertical(height: 18),
        _btnForgotPassVsRegisterTextOnly(
            title: "Quên mật khẩu?", onTap: controller.doForgetPassword),
        spaceVertical(height: 18),
        _rowOption(),
        spaceVertical(height: AppDataGlobal.safeBottom + 10),
      ],
    );
  }

  Widget _rowOption() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // _btnSocial(isFacebook: true, onTap: () => controller.doLoginSocial(type: 2)),
        // spaceHorizontal(width: 12),
        // _btnSocial(isFacebook: false, onTap: () => controller.doLoginSocial(type: 0)),
        // spaceHorizontal(width: 12),
        Expanded(
            child: _btnRegister(
                title: 'Đăng ký tài khoản mới',
                onTap: controller.onTapRegister))
      ],
    );
  }

  Widget _btnSocial({required isFacebook, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        width: 58,
        decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: BorderRadius.circular(AppDataGlobal.border),
            border: Border.all(
                color: AppColor.colorTextGrey20.withOpacity(0.2), width: 2)),
        child: Center(
          child: SvgPicture.asset(
              isFacebook ? AssetSVGName.logoFacebook : AssetSVGName.logoGoogle),
        ),
      ),
    );
  }

  Widget _btnRegister({required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: BorderRadius.circular(AppDataGlobal.border),
            border: Border.all(
                color: AppColor.colorTextGrey20.withOpacity(0.2), width: 2)),
        child: Center(
            child: CustomText.textPlusJakarta(
                text: title, style: TextAppStyle.size14W600())),
      ),
    );
  }
}
