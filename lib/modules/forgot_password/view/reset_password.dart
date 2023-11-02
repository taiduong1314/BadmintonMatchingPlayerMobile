part of 'forgot_pass_screen.dart';

extension ResetPasswordCustom on ForgotPasswordScreen {
  Widget _widgetResetPass() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceVertical(height: 38),
        _heading('Đặt lại mật khẩu'),
        spaceVertical(height: 8),
        _subHeading('Đặt lại mật khẩu'),
        spaceVertical(height: 38),
        _inputForm(
            title: "Email",
            controllerText: controller.txtEmail,
            hintText: "Nhập email của bạn"),
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
