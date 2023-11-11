part of 'wallet_screen.dart';

extension HeaderCustom on WalletScreen {
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
          text: 'Ví của tôi',
          style: TextAppStyle.h4().copyWith(color: AppColor.colorLight)),
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
              color: AppColor.colorLight,
              width: 26,
              height: 26,
            ),
          )),
    );
  }
}
