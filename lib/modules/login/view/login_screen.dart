import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/widget/space/space.dart';
import '../controller/login_controller.dart';

part 'input_form_field.dart';
part 'body.dart';
part 'login.dart';
part 'register.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              _topImage(),
              Positioned(
                  bottom: 0, child: _body()),
            ],
          ),
        );
  }

  Widget _topImage(){
    return Container(
      width: Get.width,
      height: Get.height / 2.5,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetImageName.splashBackground),
              fit: BoxFit.cover)),
      child: const Image(
          image: AssetImage(AssetImageName.logoWithTextWhite)),
    );
  }
}
