part of 'all_post_screen.dart';

extension BodyCustom on AllPostScreen {
  Widget _body() {
    return Column(children: [
      spaceVertical(height: 20),
      ...controller.listPosts.map((data) => _item(data)).toList(),
      spaceVertical(height: AppDataGlobal.safeBottom),
    ]);
  }

  Widget _item(PostSuggestionDataModel data) {
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
        child: Row(
          children: [
            NetworkImageCustom.load(
                imageUrl: data.imgUrlPost ?? '',
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
                    text: data.title ?? 'Chờ cập nhật',
                    style: TextAppStyle.h6()),
                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.location,
                    content: data.addressSlot ?? 'Chờ cập nhật'),
                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.clockCircle,
                    content: ((data.startTime ?? '') == '' && (data.endTime ?? '') == '')
                        ? 'Chờ cập nhật'
                        : '${data.startTime ?? ''} - ${data.endTime ?? ''}'),
                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.calendar,
                    content: data.days ?? 'Chờ cập nhật'),
                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.slot,
                    content: '${data.quantitySlot ?? 'Chờ cập nhật'}'),
              ],
            )),
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
