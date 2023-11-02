import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/common/color.dart';
import '../../../../utils/common/text_style.dart';
import '../../../../utils/widget/space/space.dart';
import '../../../../utils/widget/text/montserrat.dart';
import '../controller/step4_recomment_players_controller.dart';

class Step4RegisterScreen extends GetView<Step4RegisterController> {
  const Step4RegisterScreen({super.key});

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
            _heading('Gợi ý người chơi'),

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
    return CustomText.textPlusJakarta(text: '4/4', style: TextAppStyle.medium().copyWith(color: AppColor.colorBlue100));
  }
}