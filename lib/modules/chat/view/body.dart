part of 'chat_screen.dart';

extension BodyCustom on ChatScreen {
  Widget _body() {
    return SizedBox(
      width: Get.width,
      child: controller.isLoading.value
          ? const SizedBox()
          : controller.listRoom.isNotEmpty
              ? Column(
                  children: controller.listRoom
                      .map((data) => _roomChat(data))
                      .toList(),
                )
              : _widgetEmpty(),
    );
  }

  Widget _roomChat(ChatDataModel data) {
    return GestureDetector(
      onTap: () => controller.onTapChatDetail(
          roomID: data.roomId ?? -1, roomName: data.chatTitle ?? '', clientUrl: data.clientUrl ?? ''),
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorLight100, width: 1),
        ),
        child: Row(
          children: [
            NetworkImageCustom.load(
                imageUrl: data.coverImg ?? '',
                width: 60,
                height: 60,
                borderRadius: BorderRadius.circular(10),
                fit: BoxFit.cover),
            spaceHorizontal(width: 16),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText.textPlusJakarta(
                          text: data.chatTitle ?? '', style: TextAppStyle.h6()),
                    ),
                    CustomText.textPlusJakarta(
                        text: (data.lastSendTime == '' || data.lastSendTime == null) ? '' :Jiffy.parse(Utils.convertDateTimeFormat(
                                date: data.lastSendTime ?? '',
                                format: 'dd/MM/yyyy HH:mm',
                                dateFormat: 'yyyy-MM-dd HH:mm:ss'))
                            .fromNow(),
                        style: TextAppStyle.size12W400()),
                  ],
                ),
                spaceVertical(height: 8),
                CustomText.textPlusJakarta(
                    maxLine: 2,
                    text: data.lastSendMsg ?? '',
                    style: TextAppStyle.bodySmall()
                        .copyWith(color: AppColor.colorGrey1)),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _widgetEmpty() {
    return Column(
      children: [
        spaceVertical(height: 40),
        const Image(image: AssetImage(AssetImageName.empty)),
      ],
    );
  }
}
