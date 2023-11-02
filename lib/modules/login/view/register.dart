part of 'login_screen.dart';

extension RegisterCustom on LoginScreen {
  Widget _widgetRegister() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceVertical(height: 38),
        _heading('Tạo tài khoản mới'),
        spaceVertical(height: 8),
        _subHeading('Đăng ký để tiếp tục'),
        spaceVertical(height: 38),
        _inputForm(
            title: "Họ và tên",
            controllerText: controller.txtName,
            hintText: "Nhập họ và tên"),
        spaceVertical(height: 18),
        _inputForm(
            title: "Số điện thoại",
            controllerText: controller.txtPhone,
            hintText: "Nhập số điện thoại"),
        spaceVertical(height: 18),
        _inputForm(
            title: "Email",
            controllerText: controller.txtEmail,
            hintText: "Nhập email"),
        spaceVertical(height: 18),
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
        _btnLoginVsRegister(),
        spaceVertical(height: 18),
        _btnForgotPassVsRegisterTextOnly(title: "Đã có tài khoản? Đăng Nhập", onTap: controller.onTapRegister),
        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }
}
