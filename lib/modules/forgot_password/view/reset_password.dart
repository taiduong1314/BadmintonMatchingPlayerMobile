part of 'forgot_pass_screen.dart';

extension ResetPasswordCustom on ForgotPasswordScreen {
  Widget _widgetResetPass() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _heading('Đặt lại mật khẩu'),
        spaceVertical(height: 8),
        _subHeading('Đặt lại mật khẩu'),
        spaceVertical(height: 38),
        _inputPasswordForm(
            title: "Mật khẩu",
            controllerText: controller.txtPassword,
            obscureText: controller.isHidePassword.value,
            onTap: controller.doHidePassword,
            hintText: "Nhập mật khẩu"),
        spaceVertical(height: 18),
        _inputPasswordForm(
            title: "Mật khẩu xác nhận",
            controllerText: controller.txtRePassword,
            obscureText: controller.isHideRePassword.value,
            onTap: controller.doHideRePassword,
            hintText: "Nhập mật khẩu xác nhận"),
        spaceVertical(height: 18),
        _btnConfirm(),
        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }

  Widget _btnConfirm() {
    return CustomButton.commonButton(
        title: 'Xác nhận', onTap: controller.onTapInputNewPassword);
  }
}
