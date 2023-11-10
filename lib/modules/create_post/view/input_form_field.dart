part of 'create_post_screen.dart';

extension InputForm on CreatePostScreen {
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

  Widget _inputFormDescription(
      {String? title,
        required TextEditingController controllerText,
        required String hintText,
        int? minLines,
        int? maxLines,
        int? maxLength,
        TextInputType? keyboardType}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          CustomText.textPlusJakarta(
              text: title, style: TextAppStyle.bodySmallBold()),
        if (title != null) spaceVertical(height: 15),
        TextFormField(
          controller: controllerText,
          keyboardType: keyboardType,
          minLines: minLines ?? 1,
          maxLines: maxLines,
          maxLength: maxLength,
          textAlign: TextAlign.left,
          cursorColor: AppColor.colorLogo,
          textAlignVertical: TextAlignVertical.center,
          style: TextAppStyle.bodySmall(),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.all(20),
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
          // onChanged: onChangedTextField,
        ),
      ],
    );
  }
}
