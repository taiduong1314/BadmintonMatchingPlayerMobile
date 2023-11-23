import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/widget/space/space.dart';
import '../controller/setting_controller.dart';

part 'body.dart';

class AccountScreen extends GetView<AccountController> {
  @override
  final controller = Get.put(AccountController());

  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(height: 16),
              _title(),
              spaceVertical(height: 30),
              Expanded(child: _body()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return CustomText.textPlusJakarta(
        text: 'Thêm', style: TextAppStyle.h4());
  }
}
