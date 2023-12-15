import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/confirm_password_controller.dart';

part 'input_form_field.dart';

part 'header.dart';

part 'body.dart';

class ConfirmPasswordScreen extends GetView<ConfirmPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: Get.width,
            height: Get.height,
            color: AppColor.colorLight,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: _header(),
                  ),
                  spaceVertical(height: 20),
                  Expanded(child: _body()),
                ],
              ),
            )),
    );
  }
}
