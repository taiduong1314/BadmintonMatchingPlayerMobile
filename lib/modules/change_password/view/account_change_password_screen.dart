import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/common/asset/svg.dart';
import '../../../../../utils/common/button.dart';
import '../../../../../utils/common/color.dart';
import '../../../../../utils/common/data.dart';
import '../../../../../utils/common/text_style.dart';
import '../../../../../utils/widget/space/space.dart';
import '../../../../../utils/widget/text/montserrat.dart';
import '../controller/account_change_password_controller.dart';

part 'input_form_field.dart';

// part 'check_rule_forgot_password.dart';

part 'confirm_password_button.dart';
part 'header.dart';

class AccountChangePasswordScreen
    extends GetView<AccountChangePasswordController> {
  const AccountChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: Get.width,
                height: Get.height - AppDataGlobal.safeBottom,
                color: AppColor.colorBackgroundApp,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _header(),
                      Column(
                        children: [
                          spaceVertical(height: 32),
                          _oldPasswordInputField(),
                          spaceVertical(height: 16),
                          _newPasswordInputField(),
                          spaceVertical(height: 16),
                          _confirmNewPasswordInputField(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                width: Get.width - 48,
                  bottom: AppDataGlobal.safeBottom,
                  child:  _confirmButton()),
            ],
          )
          // ),
          ),
    );
  }
}
