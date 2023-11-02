
part of 'forgot_pass_screen.dart';

extension ForgotPassCustom on ForgotPasswordScreen {
  Widget _widgetForgotPass() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceVertical(height: 38),
        _heading('Quên mật khẩu'),
        spaceVertical(height: 8),
        _subHeading('Nhập email đăng ký của bạn'),
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
    return CustomButton.commonButton(title: 'Xác nhận', onTap: controller.onTapInputEmail);
  }
}