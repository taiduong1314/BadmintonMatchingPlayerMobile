import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/button.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/profile_controller.dart';

part 'body.dart';

part 'avatar.dart';

part 'header.dart';

part 'input_form_field.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        bottom: false,
        child: Container(
          color: AppColor.colorLight,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                  body: Column(
                children: [
                  _header(),
                  spaceVertical(height: 10),
                  Expanded(child: SingleChildScrollView(child: _body())),
                ],
              )),
              Positioned(
                  bottom: AppDataGlobal.safeBottom, child: _btnUpdateInfo()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btnUpdateInfo() {
    return SizedBox(
        width: Get.width - 48,
        child: CustomButton.commonButton(
            title: 'Cập nhật', onTap: controller.onTapUpdateInfo));
  }
}
