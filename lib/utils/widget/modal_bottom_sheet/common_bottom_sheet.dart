import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/asset/svg.dart';
import '../../common/color.dart';
import '../../common/data.dart';
import '../../common/text_style.dart';
import '../space/space.dart';
import '../text/montserrat.dart';

class CommonModalBottomSheet {
  static show(
      {required Widget customWidget,
      Color? barrierColor,
      double? maxHeight,
      bool isScrollControlled = false,
      bool isDismissible = true}) {
    return showModalBottomSheet(
        context: Get.context!,
        barrierColor: barrierColor,
        backgroundColor: AppColor.colorBackgroundApp,
        isDismissible: isDismissible,
        showDragHandle: false,
        enableDrag: false,
        isScrollControlled: isScrollControlled,
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? Get.height / 2,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        builder: (context) {
          return customWidget;
        });
  }

  static showUploadImage(
      {required BuildContext context,
        Function()? onTapLeftButton,
        Function()? onTapRightButton}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              spaceVertical(height: 18),
              Row(
                children: [
                  spaceHorizontal(width: 18),
                  Expanded(
                    flex: 1,
                    child: _btnChooseImage(
                        title: 'Chụp ảnh',
                        icon: AssetSVGName.cameraLens,
                        onTap: onTapLeftButton),
                  ),
                  spaceHorizontal(width: 12),
                  Expanded(
                      flex: 1,
                      child: _btnChooseImage(
                          title: 'Thư viện ảnh',
                          icon: AssetSVGName.uploadImage,
                          onTap: onTapRightButton)),
                  spaceHorizontal(width: 18),
                ],
              ),
              spaceVertical(height: 16),
              _btnCancel(),
              spaceVertical(height: AppDataGlobal.safeBottom)
            ],
          );
        });
  }

  static Widget _btnChooseImage(
      {required String title, Function()? onTap, required String icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.colorGrey300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            spaceHorizontal(width: 12),
            CustomText.textPlusJakarta(
                text: title,
                style: TextAppStyle.bodyDefault()
                    .copyWith(color: AppColor.colorDark))
          ],
        ),
      ),
    );
  }

  static Widget _btnCancel() {
    return GestureDetector(
      onTap: () => Navigator.of(Get.context!).pop(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.colorGrey300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: CustomText.textPlusJakarta(
                text: 'Hủy', style: TextAppStyle.bodyDefault().copyWith(color: AppColor.colorErrorText))),
      ),
    );
  }
}
