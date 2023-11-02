import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/common/color.dart';
import '../../../../utils/common/text_style.dart';
import '../../../../utils/widget/space/space.dart';
import '../../../../utils/widget/text/montserrat.dart';
import '../controller/step3_choose_style_play_controller.dart';


class Step3RegisterScreen extends GetView<Step3RegisterController> {
  const Step3RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorLight,
      width: Get.width,
      height: Get.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVertical(height: 40),
            _indexStep(),
            spaceVertical(height: 4),
            _heading('Chọn lối chơi của bạn'),

          ],
        ),
      ),
    );
  }

  Widget _heading(title) {
    return Container(
        alignment: Alignment.centerLeft,
        width: Get.width,
        child:
        CustomText.textPlusJakarta(text: title, style: TextAppStyle.h3()));
  }

  Widget _indexStep(){
    return CustomText.textPlusJakarta(text: '3/4', style: TextAppStyle.medium().copyWith(color: AppColor.colorBlue100));
  }
}