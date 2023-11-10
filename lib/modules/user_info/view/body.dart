part of 'user_info_screen.dart';

extension BodyCustom on UserInfoScreen {
  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controller.data.sortProfile != null) spaceVertical(height: 32),
          ReadMoreText(
            controller.data.sortProfile ?? '',
            style: TextAppStyle.size14W400()
                .copyWith(fontSize: 16, color: AppColor.colorGrey1)
                .copyWith(color: AppColor.colorGrey1, height: 1.3),
            moreStyle: TextAppStyle.bodyDefault()
                .copyWith(color: AppColor.colorBlue100),
            trimCollapsedText: ' Xem thêm',
            trimExpandedText: ' Ẩn bớt',
          ),
          spaceVertical(height: 16),
          _ratingBar(title: 'Đánh giá', rating: controller.data.totalRate ?? 5),
          spaceVertical(height: 14),
          _ratingBar(title: 'Kỹ năng', rating: controller.data.levelSkill ?? 5),
          spaceVertical(height: 14),
          _ratingBar(
              title: 'Thân thiện', rating: controller.data.friendly ?? 5),
          spaceVertical(height: 14),
          _ratingBar(title: 'Tin tưởng', rating: controller.data.trusted ?? 5),
          spaceVertical(height: 14),
          _ratingBar(title: 'Hỗ trợ', rating: controller.data.helpful ?? 5),
          spaceVertical(height: 32),
          _title('Viết lời bình luận'),
          spaceVertical(height: 14),
          _sendComment(),
          spaceVertical(height: 32),
          _title('Bình luận'),
          _listComments(),
          
          spaceVertical(height: AppDataGlobal.safeBottom),
        ],
      ),
    );
  }

  Widget _ratingBar({required String title, required double rating}) {
    return Row(
      children: [
        if (title != '')
          SizedBox(
            width: 110,
            child: CustomText.textPlusJakarta(
                text: title,
                style: TextAppStyle.bodyDefault()
                    .copyWith(color: AppColor.colorGrey1)),
          ),
        Expanded(
          child: RatingBar.builder(
            initialRating: rating,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: AppColor.colorLogo,
            ),
            itemSize: 16,
            onRatingUpdate: (double value) {},
          ),
        ),
      ],
    );
  }

  Widget _title(String title) {
    return CustomText.textPlusJakarta(text: title, style: TextAppStyle.h4());
  }

  Widget _sendComment() {
    return Stack(
      children: [
        _inputFormDescription(
            controllerText: controller.txtComment,
            hintText: 'Nhập lời bình luận',
            keyboardType: TextInputType.multiline,
            minLines: 6,
            maxLines: 8),
        Positioned(
            bottom: 12,
            right: 12,
            child: GestureDetector(
              onTap: controller.sendComment,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(color: AppColor.colorGrey300)),
                child: Center(
                  child: Icon(Icons.send, color: AppColor.colorDark.withOpacity(0.5),),
                ),
              ),
            ))
      ],
    );
  }

  Widget _listComments() {
    return Obx(
      () => Column(
        children:
            controller.listComments.map((data) => _itemComment(data)).toList(),
      ),
    );
  }

  Widget _itemComment(CommentDataModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceVertical(height: 15),
        Row(
          children: [
            NetworkImageCustom.load(
                border: Border.all(color: AppColor.colorGrey1, width: 1),
                width: 60,
                height: 60,
                imageUrl: data.userAvatar ?? '',
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(100)),
            spaceHorizontal(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.textPlusJakarta(
                    text: data.userName ?? '', style: TextAppStyle.h5()),
                spaceVertical(height: 8),
                _ratingBar(title: '', rating: data.totalRate ?? 5),
              ],
            )),
          ],
        ),
        if (data.content != null || data.content != '')
          spaceVertical(height: 12),
        if (data.content != null || data.content != '')
          ReadMoreText(
            data.content ?? '',
            style: TextAppStyle.size14W400()
                .copyWith(fontSize: 16, color: AppColor.colorGrey1)
                .copyWith(color: AppColor.colorGrey1, height: 1.3),
            moreStyle: TextAppStyle.bodyDefault()
                .copyWith(color: AppColor.colorBlue100),
            trimCollapsedText: ' Xem thêm',
            trimExpandedText: ' Ẩn bớt',
          ),
        spaceVertical(height: 12),
        CustomText.textPlusJakarta(
            text: (data.savedDate == null || data.savedDate == '')
                ? ''
                : Utils.convertDateTime(
                    date: data.savedDate!, dateFormat: 'HH:mm dd/MM/yyyy'),
            style:
                TextAppStyle.bodySmall().copyWith(color: AppColor.colorGrey1)),
        spaceVertical(height: 15),
      ],
    );
  }
}
