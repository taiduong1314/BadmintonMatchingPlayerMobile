part of 'deposit_withdraw_screen.dart';

extension InputForm on DepositWithdrawScreen {
  Widget _inputForm(
      {String? title,
        Function(String)? onChanged,
       TextEditingController? controllerText,
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
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColor.colorTextGrey20.withOpacity(0.2),
                    width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColor.colorTextGrey20.withOpacity(0.2),
                    width: 1.0),
              ),
            ),
            onChanged: onChanged,

          ),
        ),
      ],
    );
  }
}
