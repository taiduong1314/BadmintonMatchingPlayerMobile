part of 'confirm_password_screen.dart';

extension Body on ConfirmPasswordScreen {
  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Obx(() => _inputPasswordForm(
              controllerText: controller.txtPassword,
              hintText: 'Nhập mật khẩu',
              onTap: controller.doHidePassword,
              obscureText: controller.isHidePassword.value)),
          const Spacer(),
          CustomButton.commonButton(
              title: 'Tiếp tục', onTap: controller.onTapConfirm),
          spaceVertical(height: Platform.isAndroid ? 10 : 0),
        ],
      ),
    );
  }
}
