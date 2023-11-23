part of 'account_change_password_screen.dart';

extension ConfirmPasswordButton on AccountChangePasswordScreen {
  Widget _confirmButton() {
    return CustomButton.commonButton(
        title: 'Xác nhận mật khẩu',
        onTap: controller.doActionTapConfirmPassword);
    }
}
