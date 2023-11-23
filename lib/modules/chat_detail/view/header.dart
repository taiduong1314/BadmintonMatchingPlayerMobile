part of 'chat_detail_view.dart';

extension HeaderCustom on ChatDetailScreen {
  Widget _header() {
    return Stack(
      children: [
        _titleHeader(),
        Positioned(left: 0, child: _btnBack()),
      ],
    );
  }

  Widget _titleHeader() {
    return Container(
      width: Get.width,
      height: 40,
      alignment: Alignment.center,
      child: CustomText.textPlusJakarta(
          text: controller.roomName,
          style: TextAppStyle.h4()),
    );
  }

  Widget _btnBack() {
    return GestureDetector(
      onTap: Get.back,
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: AppColor.colorLight.withOpacity(0),
              borderRadius: BorderRadius.circular(100)),
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
