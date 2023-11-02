part of 'forgot_pass_screen.dart';

extension OTPVerifyCustom on ForgotPasswordScreen {
  Widget _widgetOtpVerify() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceVertical(height: 38),
        _heading('Xác thực tài khoản'),
        spaceVertical(height: 8),
        _subHeading('Vui lòng nhập OTP xác thực'),
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
        title: 'Xác nhận', onTap: controller.onTapOtpVerify);
  }
}
