part of 'confirm_password_screen.dart';

extension InputForm on ConfirmPasswordScreen {
  Widget _inputPasswordForm(
      {String? title,
      required TextEditingController controllerText,
      required String hintText,
      bool obscureText = false,
      Function()? onTap,
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
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: AppColor.colorTextGrey20.withOpacity(0.2),
                  width: 2.0)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controllerText,
                  keyboardType: keyboardType,
                  minLines: 1,
                  textAlign: TextAlign.left,
                  cursorColor: AppColor.colorLogo,
                  obscureText: obscureText,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextAppStyle.bodySmall(),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 15, left: 16),
                      hintText: hintText,
                      hintStyle: TextAppStyle.bodySmall()
                          .copyWith(color: AppColor.colorTextGrey100),
                      border: InputBorder.none),
                  // onChanged: onChangedTextField,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  obscureText ? AssetSVGName.eyeOff : AssetSVGName.eyeOn,
                  width: 18,
                  height: 18,
                ),
              ),
              spaceHorizontal(width: 15),
            ],
          ),
        ),
      ],
    );
  }
}
