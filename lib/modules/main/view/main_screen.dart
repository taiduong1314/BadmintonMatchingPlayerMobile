import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/main_controller.dart';

part 'bottom_bar.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          color: AppColor.colorLight,
          child: controller.mainWidget.value,
        ),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }
}
