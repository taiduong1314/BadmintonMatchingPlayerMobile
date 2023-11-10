import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/color.dart';

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
}
