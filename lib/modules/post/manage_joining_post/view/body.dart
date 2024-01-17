part of 'manage_joining_post_screen.dart';

extension BodyCustom on ManageJoiningPostScreen {
  Widget _body() {
    return Column(children: [
      spaceVertical(height: 20),
      ...controller.listPosts.map((data) => _item(data)).toList(),
      spaceVertical(height: AppDataGlobal.safeBottom),
    ]);
  }

  Widget _item(JoinedPostDataModel data) {
    return GestureDetector(
      onTap: () => controller.onTapPost(data),
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorLight100, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                NetworkImageCustom.load(
                    imageUrl: data.coverImage ?? '',
                    width: 80,
                    height: 120,
                    borderRadius: BorderRadius.circular(10),
                    fit: BoxFit.cover),
                spaceHorizontal(width: 16),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText.textPlusJakarta(
                        text: data.postTitle ?? '', style: TextAppStyle.h6()),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.location,
                        content: data.areaName ?? ''),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.clockCircle,
                        content:
                            '${Utils.convertDateTimeFormat(date: data.startTime ?? '', dateFormat: 'HH:mm', format: 'dd/MM/yyyy hh:mm:ss')} - ${Utils.convertDateTimeFormat(date: data.endTime ?? '', dateFormat: 'HH:mm', format: 'dd/MM/yyyy hh:mm:ss')}'),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.calendar,
                        content: Utils.convertDateTimeFormat(
                            date: data.startTime ?? '',
                            dateFormat: 'dd/MM/yyyy',
                            format: 'dd/MM/yyyy hh:mm:ss')),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.slot,
                        content: data.availableSlot ?? ''),
                  ],
                )),
              ],
            ),
            spaceVertical(height: 20),
            Center(
              child: Container(
                width: Get.width / 2,
                height: 1,
                color: AppColor.colorGrey300,
              ),
            ),
            spaceVertical(height: 16),
            CustomText.textPlusJakarta(
              text: data.status ?? '',
              style: TextAppStyle.h6(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textWithIcon(
      {required String assetSVGName, required String content}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SvgPicture.asset(assetSVGName, width: 16, height: 16),
        spaceHorizontal(width: 9),
        Flexible(
            child: CustomText.textPlusJakarta(
                text: content,
                style: TextAppStyle.bodySmall()
                    .copyWith(color: AppColor.colorGrey1)))
      ],
    );
  }
}
