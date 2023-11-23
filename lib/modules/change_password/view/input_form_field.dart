part of 'account_change_password_screen.dart';

extension InputForm on AccountChangePasswordScreen {
  Widget _inputForm(
      {required TextEditingController txtController,
      required String hintText,
      Function()? onTap,
      Function(String)? onChangedTextField,
      String? title,
      bool obscureText = true,
      TextInputType? keyboardType}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          CustomText.textPlusJakarta(
              text: title, style: TextAppStyle.bodySmallBold()),
        if (title != null) spaceVertical(height: 15),
        Container(
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.colorGrey300, width: 1.0)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  controller: txtController,
                  keyboardType: keyboardType,
                  minLines: 1,
                  textAlign: TextAlign.left,
                  obscureText: obscureText,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16, bottom: 15),
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                  onTap: controller.resetCheckErrorState,
                  onChanged: onChangedTextField,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  spaceHorizontal(width: 6),
                  SvgPicture.asset(
                      obscureText ? AssetSVGName.eyeOff : AssetSVGName.eyeOn),
                ]),
              ),
              spaceHorizontal(width: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _oldPasswordInputField() {
    return _inputForm(
        txtController: controller.txtOldPassword,
        obscureText: !controller.isHideOldPassword.value,
        onTap: controller.doChangeTypeOldPassword,
        title: 'Mật khẩu hiện tại',
        hintText: 'Mật khẩu cũ');
  }

  Widget _newPasswordInputField() {
    return _inputForm(
        txtController: controller.txtPassword,
        obscureText: !controller.isHidePassword.value,
        onTap: controller.doChangeTypePassword,
        title: 'Mật khẩu mới',
        hintText: 'Mật khẩu mới');
  }

  Widget _confirmNewPasswordInputField() {
    return _inputForm(
        txtController: controller.txtConfirmPassword,
        obscureText: !controller.isHideConfirmPassword.value,
        onTap: controller.doChangeTypeConfirmPassword,
        onChangedTextField: (value) {},
        title: 'Xác nhận mật khẩu mới',
        hintText: 'Xác nhận lại mật khẩu mới');
  }
}
