part of 'chat_detail_view.dart';

extension Message on ChatDetailScreen {
  Widget _chatFrom(String? message, String? date,
      {bool isImage = false, Widget? widget, String? username}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
              child: _message(message, date,
                  isImage: isImage,
                  isFrom: true,
                  widget: widget,
                  username: username)),
          // spaceHorizontal(width: 12),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: Image(
          //     image: AssetImage(AssetImageName.logoApp),
          //     width: 40,
          //     height: 40,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _chatTo(String? message, String? date,
      {Widget? widget, String? username}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: Image(
          //     image: AssetImage(AssetImageName.logoApp),
          //     width: 40,
          //     height: 40,
          //   ),
          // ),
          // spaceHorizontal(width: 12),
          Flexible(
              child:
                  _message(message, date, widget: widget, username: username)),
        ],
      ),
    );
  }

  Widget _message(String? message, String? date,
      {String? username,
      bool isFrom = false,
      bool isImage = false,
      Widget? widget}) {
    final parseText = <MatchText>[
      MatchText(
          type: ParsedType.URL,
          style: TextAppStyle.bodySmall().copyWith(
              color: isFrom ? AppColor.colorLight : const Color(0xFF0086b3),
              decoration: TextDecoration.underline),
          onTap: (url) async {
            Utils.launchURL(Uri.parse(url));
          }),
    ];

    return Container(
      constraints: const BoxConstraints(minHeight: 40),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isFrom
            ? const Color(0xFFE3EEFF)
            : AppColor.colorLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.colorDark.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 0), // Điều chỉnh vị trí đổ bóng
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isFrom ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (username != null)
            CustomText.textPlusJakarta(
                text: username,
                textAlign: TextAlign.start,
                style: TextAppStyle.bodySmall().copyWith(
                    color:
                        isFrom ? AppColor.colorDark : AppColor.colorTextGrey),
                maxLine: 1),
          if (username != null) spaceVertical(height: 6),
          if (isImage)
            GestureDetector(
                onTap: () async => await controller
                    .showImageFullScreen(imgUrl: [message ?? ''], index: 0),
                child: NetworkImageCustom.load(
                    imageUrl: message ?? '',
                    width: 200,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12))),
          if (!isImage)
            ParsedText(
              text: message ?? '',
              style: TextAppStyle.bodyDefault().copyWith(
                  color: isFrom ? AppColor.colorDark : AppColor.colorDark),
              alignment: TextAlign.start,
              maxLines: 100000,
              parse: parseText,
            ),
          widget ?? const SizedBox(),
          if (date != '') spaceVertical(height: 6),
          if (date != '')
            CustomText.textPlusJakarta(
                textAlign: TextAlign.start,
                text: Utils.convertDateTime(
                    date: date ?? '', dateFormat: 'HH:mm'),
                style: TextAppStyle.size12W400().copyWith(
                    color: isFrom
                        ? AppColor.colorDark.withOpacity(0.8)
                        : AppColor.colorText.withOpacity(0.6))),
        ],
      ),
    );
  }

  Widget _chatBot(String? message, String? date) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.textPlusJakarta(
                  text: Utils.convertDateTime(
                      date: date ?? '', dateFormat: 'HH:mm dd/MM'),
                  style: TextAppStyle.bodySmall()
                      .copyWith(color: AppColor.colorTextGrey)),
              if (message != '')
                CustomText.textPlusJakarta(
                    text: message ?? '',
                    style: TextAppStyle.bodySmall()
                        .copyWith(color: AppColor.colorTextGrey)),
            ],
          ),
        ));
  }
}
