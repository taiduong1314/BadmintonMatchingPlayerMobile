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
import '../controller/step3_choose_style_play_controller.dart';

part 'input_form.dart';

class Step3RegisterScreen extends GetView<Step3RegisterController> {
  const Step3RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
              spaceVertical(height: 30),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  ...controller.listStyle
                      .map((element) => _stylePlay(element))
                      .toList(),
                ]),
              )),
              Row(
                children: [
                  Expanded(child: _btnBack()),
                  spaceHorizontal(width: 11),
                  Expanded(child: _btnNext()),
                ],
              ),
              spaceVertical(height: AppDataGlobal.safeBottom),
            ],
          ),
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
        text: '3/4',
        style: TextAppStyle.medium().copyWith(color: AppColor.colorBlue100));
  }

  Widget _stylePlay(data) {
    RxBool isSelected = controller.listStyleChoosing.contains(data).obs;
    return GestureDetector(
      onTap: () => controller.onTapSkill(data),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: BorderRadius.circular(AppDataGlobal.border),
            border: Border.all(
                color: isSelected.value
                    ? AppColor.colorBlue
                    : AppColor.colorLight100)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  isSelected.value
                      ? AssetSVGName.radioSelected
                      : AssetSVGName.radioDisabled,
                  width: 20,
                  height: 20,
                ),
                spaceHorizontal(width: 15),
                Flexible(
                  child: CustomText.textPlusJakarta(
                      maxLine: 3,
                      textAlign: TextAlign.start,
                      text: data ?? '',
                      style: TextAppStyle.h6()),
                ),
              ],
            ),
            if (controller.canInput.isTrue && controller.listStyle.last.contains(data)) spaceVertical(height: 16),
            if (controller.canInput.isTrue && controller.listStyle.last.contains(data)) _inputForm(),
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
