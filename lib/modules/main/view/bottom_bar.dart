part of 'main_screen.dart';

extension BottomBar on MainScreen {
  // Widget _bottomBar() {
  //   return BottomBarFloating(
  //     items: controller.itemsBottomBar,
  //     backgroundColor: AppColor.colorBackgroundApp,
  //     color: AppColor.colorTextGrey,
  //     colorSelected: Colors.blueAccent,
  //     indexSelected: controller.indexBottomBar.value,
  //     paddingVertical: 30,
  //     animated: true,
  //     blur: 0,
  //     onTap: (int index) {
  //       if (controller.indexBottomBar.value == index) return;
  //
  //       switch (index) {
  //         case 0:
  //           controller.mainWidget.value = HomeScreen();
  //           break;
  //         case 1:
  //           controller.mainWidget.value = ListChatScreen();
  //           break;
  //         case 2:
  //           controller.mainWidget.value = AccountScreen();
  //           break;
  //         default:
  //           controller.mainWidget.value = HomeScreen();
  //           break;
  //       }
  //
  //       controller.indexBottomBar.value = index;
  //     },
  //   );
  // }

  Widget _bottomBar() {
    return SizedBox(
      width: Get.width,
      height:  Platform.isIOS ? 116 : 100,
      child: Stack(
        children: [
          Positioned(
            bottom: Platform.isIOS ? 0 : 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: BottomAppBar(
                  color: AppColor.colorLight,
                  clipBehavior: Clip.antiAlias,
                  elevation: 32,
                  shape: const CircularNotchedRectangle(),
                  height: 80,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            controller.listImageBottomBar.length, (index) {
                          bool isActive =
                              controller.indexBottomBar.value == index;

                          return index == 2
                              ? InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () =>
                                      controller.doSelectBottomBar(index),
                                  child: _itemImageBottomBar(
                                      assetImage:
                                          controller.listImageBottomBar[index],
                                      isActive: isActive),
                                )
                              : InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () =>
                                      controller.doSelectBottomBar(index),
                                  child: _itemBottomBar(
                                      title:
                                          controller.listTitleBottomBar[index],
                                      asset:
                                          controller.listImageBottomBar[index],
                                      isActive: isActive),
                                );
                        })),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemImageBottomBar(
      {required String assetImage, bool isActive = false}) {
    return SizedBox(
      width: Get.width / 5,
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isActive ? AppColor.colorBlueBottom : AppColor.colorLight,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColor.colorBlueBottom, width: 2)),
          child: SvgPicture.asset(
            assetImage,
            color: isActive ? AppColor.colorLight : AppColor.colorBlueBottom,
          ),
        ),
      ),
    );
  }

  Widget _itemBottomBar(
      {required String asset, required String title, bool isActive = false}) {
    return Container(
      width: Get.width / 5,
      height: 80,
      padding: const EdgeInsets.fromLTRB(6, 16, 6, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                asset,
                color: isActive ? AppColor.colorBlueBottom : AppColor.colorDark,
              )),
          spaceVertical(height: 10),
          CustomText.textPlusJakarta(
              text: title,
              style: TextAppStyle.size10W600().copyWith(
                color: isActive ? AppColor.colorBlueBottom : AppColor.colorDark,
                fontSize: 10,
                letterSpacing: 0.4,
              )),
          if (isActive) const Spacer(),
          if (isActive)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.colorBlueBottom,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
        ],
      ),
      // color: Colors.red,
    );
  }
}
