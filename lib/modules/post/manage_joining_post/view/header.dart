part of 'manage_joining_post_screen.dart';

extension HeaderCustom on ManageJoiningPostScreen {
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
          text: 'Quản lý bài viết',
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
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColor.colorGrey300)),
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
