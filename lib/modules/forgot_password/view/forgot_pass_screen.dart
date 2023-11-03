
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:vbmsports/utils/common/button.dart';

import '../../../utils/common/asset/image.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/func/countdown_timer.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/forgot_pass_controller.dart';

part 'body.dart';
part 'input_form_field.dart';
part 'forgot_password.dart';
part 'otp_verify.dart';
part 'reset_password.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController>{
  const ForgotPasswordScreen({super.key});

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
      height: Get.height / 1.3,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetImageName.splashBackground),
              fit: BoxFit.cover)),
      child: const Image(
          image: AssetImage(AssetImageName.logoWithTextWhite)),
    );
  }
}