import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/utils.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/deposit_withdraw_controller.dart';

part 'header.dart';

part 'input_form_field.dart';

part 'body.dart';

class DepositWithdrawScreen extends GetView<DepositWithdrawController> {
  const DepositWithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColor.colorLight,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            _header(),
            Expanded(child: _body()),
          ],
        ),
      )),
    );
  }
}
