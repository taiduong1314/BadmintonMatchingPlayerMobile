part of 'post_detail_screen.dart';

extension Banner on PostDetailScreen {
  Widget _banner({double? width, double? height}) {
    return Stack(
      children: [
        controller.dataDetail.imageUrls?.length == 0
            ? const SizedBox()
            : ImageSlideshow(
                  initialPage: 0,
                  width: width ?? Get.width,
                  height: height ?? 305,
                  autoPlayInterval: 6000,
                  isLoop: true,
                  indicatorRadius: 0,
                  onPageChanged: (value) =>
                      controller.indexBanner.value = value,
                  children: (controller.dataDetail.imageUrls == [] ||
                          controller.dataDetail.imageUrls == null)
                      ? [
                          Center(
                              child: Image(
                                  width: Get.width / 1.5,
                                  image: const AssetImage(
                                      AssetImageName.logoWithTextWhite)))
                        ]
                      : controller.dataDetail.imageUrls!
                          .map((url) => _imageBanner(imageUrl: url))
                          .toList(),
                ),
        controller.dataDetail.imageUrls?.length == 0
            ? const SizedBox()
            : Obx(
          () => Positioned(
              width: Get.width,
              bottom: (height ?? 305) / 2.5,
              child: Center(child: _indicatorBlur())),
        ),
        Positioned(left: 24, top: AppDataGlobal.safeTop, child: _btnBack()),
      ],
    );
  }

  Widget _imageBanner({String? imageUrl}) {
    return NetworkImageCustom.load(
      imageUrl: imageUrl ?? '',
      fit: BoxFit.cover,
      padding: const EdgeInsets.all(0),
      hideProgressIndicator: false,
      hideErrorWidget: true
    );
  }

  Widget _indicatorBlur() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(controller.dataDetail.imageUrls?.length ?? 0,
            (index) {
          bool checkCurrentIndex = controller.indexBanner.value == index;
          return Container(
            margin: const EdgeInsets.all(4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: checkCurrentIndex
                    ? AppColor.colorButton
                    : AppColor.colorUnknown3,
                borderRadius: BorderRadius.circular(100)),
          );
        }),
      ).frosted(blur: 5, borderRadius: BorderRadius.circular(12)),
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
