import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../../../utils/common/asset/animation.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                AppColor.colorLogo,
                BlendMode.modulate,
              ),
              child: Lottie.asset(
                AssetAnimationCustom.splash,
                onLoaded: controller.onLoadedLotie,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          CustomText.textPlusJakarta(
              text: AppDataGlobal.appName.toUpperCase(),
              style: TextAppStyle.size35()
                  .copyWith(color: AppColor.colorText))
        ],
      ),
    );
  }
}
