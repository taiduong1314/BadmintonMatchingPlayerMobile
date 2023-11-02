import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/common/asset/svg.dart';
import '../../../../utils/common/button.dart';
import '../../../../utils/common/color.dart';
import '../../../../utils/common/data.dart';
import '../../../../utils/common/text_style.dart';
import '../../../../utils/widget/space/space.dart';
import '../../../../utils/widget/text/montserrat.dart';
import '../controller/step2_choose_skill_controller.dart';

class Step2RegisterScreen extends GetView<Step2RegisterController> {
  const Step2RegisterScreen({super.key});

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
            _heading('Chọn kỹ năng của bạn'),
            ...controller.listSkills.map((element) => _skill(element)).toList(),
            if (controller.listSkills.isNotEmpty) spaceVertical(height: 38),
            if (controller.listSkills.isNotEmpty)
              Row(
                children: [
                  _btnNext(),
                  spaceVertical(height: 11),
                  _btnBack(),
                ],
              ),
            spaceVertical(height: AppDataGlobal.safeBottom),
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

  Widget _indexStep() {
    return CustomText.textPlusJakarta(
        text: '2/4',
        style: TextAppStyle.medium().copyWith(color: AppColor.colorBlue100));
  }

  Widget _skill(data) {
    return GestureDetector(
      onTap: () => controller.onTapSkill(data),
      child: Container(
        width: Get.width,
        color: AppColor.colorLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            SvgPicture.asset(controller.skillSelected.value == data
                ? AssetSVGName.radioActive
                : AssetSVGName.radioDisabled),
            spaceHorizontal(width: 15),
            CustomText.textPlusJakarta(
                text: data.name ?? '', style: TextAppStyle.h6()),
          ],
        ),
      ),
    );
  }

  Widget _btnNext() {
    return CustomButton.commonButton(
        onTap: controller.onTapNext, title: 'Tiếp tục', height: 58);
  }

  Widget _btnBack() {
    return CustomButton.commonButton(
        title: 'Quay lại',
        onTap: controller.onTapBack,
        backgroundColor: AppColor.colorLight,
        borderColor: AppColor.colorBoder,
        titleColor: AppColor.colorDark);
  }
}
