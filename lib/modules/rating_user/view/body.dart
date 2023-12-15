part of 'rating_user_screen.dart';

extension BodyCustom on RatingUserScreen {
  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          spaceVertical(height: 32),
          // _ratingBar(title: 'Đánh giá', rating: 5),
          // spaceVertical(height: 18),
          _ratingBar(title: 'Kỹ năng', rating: controller.levelSkill.value),
          spaceVertical(height: 18),
          _ratingBar(title: 'Thân thiện', rating: controller.helpful.value),
          spaceVertical(height: 18),
          _ratingBar(title: 'Tin tưởng', rating: controller.trusted.value),
          spaceVertical(height: 18),
          _ratingBar(title: 'Hỗ trợ', rating: controller.helpful.value),
          spaceVertical(height: 32),
          _inputFormDescription(
              controllerText: controller.txtMessage,
              hintText: 'Viết đánh giá',
              minLines: 6,
              maxLines: 8),
          spaceVertical(height: AppDataGlobal.safeBottom + 60),
        ],
      ),
    );
  }

  Widget _ratingBar({required String title, required double rating}) {
    return Row(
      children: [
        if (title != '')
          SizedBox(
            width: 120,
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
            ignoreGestures: false,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: AppColor.colorLogo,
            ),
            itemSize: 20,
            onRatingUpdate: (double value) {},
          ),
        ),
      ],
    );
  }

  Widget _title(String title) {
    return CustomText.textPlusJakarta(text: title, style: TextAppStyle.h4());
  }
}
