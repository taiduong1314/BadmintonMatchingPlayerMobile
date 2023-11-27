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
                onPageChanged: (value) => controller.indexBanner.value = value,
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
        Positioned(
            right: 24, top: AppDataGlobal.safeTop, child: _btnOptional()),
      ],
    );
  }

  Widget _imageBanner({String? imageUrl}) {
    return NetworkImageCustom.load(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        padding: const EdgeInsets.all(0),
        hideProgressIndicator: false,
        hideErrorWidget: true);
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

  Widget _btnOptional() {
    // return GestureDetector(
    //   onTap: Get.onTapOptionalAction,
    //   child: Container(
    //       width: 40,
    //       height: 40,
    //       decoration: BoxDecoration(
    //         color: AppColor.colorLight,
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       child: const Center(
    //         child:Icon(Icons.more_vert),
    //       )),
    // );

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.colorLight,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(Icons.more_vert),
            )),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          controller.onTapOptional(id: value!.id);
        },
        dropdownStyleData: DropdownStyleData(
          useSafeArea: true,
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          offset: const Offset(0, -10),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 36),
          ],
          padding: const EdgeInsets.only(left: 24, right: 24),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.id,
    required this.text,
    required this.icon,
  });

  final int id;
  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [home, share];

  // static const List<MenuItem> secondItems = [logout];

  static const home =
      MenuItem(id: 0, text: 'Trò chuyện nhóm', icon: Icons.group_add_outlined);
  static const share =
      MenuItem(id: 1, text: 'Hủy đặt chỗ', icon: Icons.dangerous_outlined);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: AppColor.colorDark.withOpacity(0.6), size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: CustomText.textPlusJakarta(
              text: item.text, style: TextAppStyle.size14W400()),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
    }
  }
}
