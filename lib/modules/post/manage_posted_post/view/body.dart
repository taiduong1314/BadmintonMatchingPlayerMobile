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
                    text: data.title ?? '', style: TextAppStyle.h6()),

                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.location,
                    content: data.address ?? ''),
                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.clockCircle,
                    content: '${data.time}'),
                // spaceVertical(height: 8),
                // _textWithIcon(
                //     assetSVGName: AssetSVGName.calendar,
                //     content: data. ?? ''),
                spaceVertical(height: 8),
                _textWithIcon(
                    assetSVGName: AssetSVGName.slot,
                    content: '${data.availableSlot ?? ''}'),
                spaceVertical(height: 8),
                data.isDelete == true
                    ? const Text(
                        'Đã Xóa',
                        style: TextStyle(color: Color(0xFFFF0000)),
                      )
                    : data.status == true
                        ? const Text(
                            'Đang hoạt động',
                            style: TextStyle(color: Color(0xFF00AA00)),
                          )
                        : const Text(
                            'Đã ẩn',
                            style: TextStyle(color: Color(0xFF0000AA)),
                          ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.bootsPost(data.postId ?? 0);
                      },
                      child: const Icon(
                        Icons.arrow_circle_up_sharp,
                        size: 28,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.deletePost(data.postId ?? 0);
                      },
                      child: const Icon(
                        Icons.delete,
                        size: 28,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
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
