part of 'rating_user_screen.dart';

extension HeaderCustom on RatingUserScreen{
  Widget _header(){
    return Stack(
      children: [
        _titleHeader(),
        Positioned(
            left: 24,
            child: _btnBack()),
      ],
    );
  }

  Widget _titleHeader(){
    return Container(
      width: Get.width,
      height: 40,
      alignment: Alignment.center,
      child: Row(
        children: [
          spaceHorizontal(width: 80),
          NetworkImageCustom.load(
              border: Border.all(color: AppColor.colorGrey1, width: 1),
              width: 40,
              height: 40,
              imageUrl:  controller.dataUser.imgUrl ?? '',
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(100)),
          spaceHorizontal(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText.textPlusJakarta(
                    text:  controller.dataUser.fullName ?? '',
                    style: TextAppStyle.h6()),
                spaceVertical(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _btnBack() {
    return GestureDetector(
      onTap: Get.back,
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColor.colorGrey300)
          ),
          child: Center(
            child: SvgPicture.asset(
              AssetSVGName.arrowLeft,
              color: AppColor.colorDark,
              width: 26,
              height: 26,
            ),
          )),
    );
  }
}