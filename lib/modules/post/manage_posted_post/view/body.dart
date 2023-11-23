part of 'manage_posted_post_screen.dart';

extension BodyCustom on ManagePostedPostScreen {
  Widget _body() {
    return Column(children: [
      spaceVertical(height: 20),
      ...controller.listPosts.map((data) => _item(data)).toList(),
      spaceVertical(height: AppDataGlobal.safeBottom),
    ]);
  }

  Widget _item(PostedPostDataModel data) {
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
                imageUrl: data.postImgUrl ?? '',
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
                        text: 'Tên sân chưa có trong api', style: TextAppStyle.h6()),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.location,
                        content: data.address ?? ''),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.clockCircle,
                        content:
                        '${data.time}'),
                    // spaceVertical(height: 8),
                    // _textWithIcon(
                    //     assetSVGName: AssetSVGName.calendar,
                    //     content: data. ?? ''),
                    spaceVertical(height: 8),
                    _textWithIcon(
                        assetSVGName: AssetSVGName.slot,
                        content: '${data.availableSlot ?? ''}'),
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