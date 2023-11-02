part of 'forgot_pass_screen.dart';

extension InputForm on ForgotPasswordScreen {
  Widget _inputForm(
      {String? title,
      required TextEditingController controllerText,
      required String hintText,
      TextInputType? keyboardType}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          CustomText.textPlusJakarta(
              text: title, style: TextAppStyle.bodySmallBold()),
        if (title != null) spaceVertical(height: 15),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controllerText,
            keyboardType: keyboardType,
            minLines: 1,
            textAlign: TextAlign.left,
            cursorColor: AppColor.colorLogo,
            textAlignVertical: TextAlignVertical.center,
            style: TextAppStyle.bodySmall(),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(bottom: 11, left: 15, right: 15),
              hintText: hintText,
              hintStyle: TextAppStyle.bodySmall()
                  .copyWith(color: AppColor.colorTextGrey100),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                    color: AppColor.colorTextGrey20.withOpacity(0.2),
                    width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                    color: AppColor.colorTextGrey20.withOpacity(0.2),
                    width: 2.0),
              ),
            ),
            // onChanged: onChangedTextField,
          ),
        ),
      ],
    );
  }
}
