part of 'news_screen.dart';

extension Banner on NewsScreen {
  Widget _banner({double? width, double? height}) {
    return Stack(
      children: [
        ImageSlideshow(
          initialPage: 0,
          width: width ?? Get.width,
          height: height ?? 305,
          autoPlayInterval: 6000,
          isLoop: true,
          indicatorRadius: 0,
          onPageChanged: (value) => controller.indexBanner.value = value,
          children: controller.listBanner
              .map((url) => _imageBanner(imageUrl: url))
              .toList(),
        ),
        Obx(
          () => Positioned(
              width: Get.width,
              bottom: 10,
              child: Center(child: _indicatorBlur())),
        ),
        // Positioned(left: 24, top: 10, child: _btnBack()),
      ],
    );
  }

  Widget _imageBanner({String? imageUrl}) {
    return Image(
      image: AssetImage(imageUrl!),
      fit: BoxFit.cover,
    );
  }

  Widget _indicatorBlur() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(controller.listBanner.length, (index) {
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

  // Widget _btnBack() {
  //   return GestureDetector(
  //     onTap: Get.back,
  //     child: Container(
  //         width: 40,
  //         height: 40,
  //         decoration: BoxDecoration(
  //           color: AppColor.colorLight,
  //           borderRadius: BorderRadius.circular(100),
  //         ),
  //         child: Center(
  //           child: SvgPicture.asset(
  //             AssetSVGName.arrowLeft,
  //             color: AppColor.colorDark,
  //             width: 26,
  //             height: 26,
  //           ),
  //         )),
  //   );
  // }
}
