import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/model/location/location_model.dart';
import 'package:vbmsports/utils/common/asset/svg.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../controller/step1_choose_districts_controller.dart';

part 'provinces.dart';

part 'districts.dart';

class Step1RegisterScreen extends GetView<Step1RegisterController> {
  const Step1RegisterScreen({super.key});

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
              _heading('Chọn khu vực của bạn'),
              Expanded(
                child: Obx(
                  () => SingleChildScrollView(
                    child: controller.isChoosingProvinces.value
                        ? _listProvinces()
                        : _listDistricts(),
                  ),
                ),
              ),
              if (controller.listDistricts.isNotEmpty) spaceVertical(height: 10),
              if (controller.listDistricts.isNotEmpty) Row(
                mainAxisSize: MainAxisSize.max,
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
        text: '1/4',
        style: TextAppStyle.medium().copyWith(color: AppColor.colorBlue100));
  }
}
