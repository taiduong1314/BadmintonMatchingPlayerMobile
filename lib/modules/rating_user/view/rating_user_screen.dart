import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/data.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/rating_user_controller.dart';

part 'header.dart';

part 'body.dart';

part 'input_form_field.dart';

class RatingUserScreen extends GetView<RatingUserController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorLight,
      width: Get.width,
      height: Get.height,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _header(),
            Expanded(child: SingleChildScrollView(child: _body())),
            _btnSendRating(),
            spaceVertical(height: AppDataGlobal.safeBottom),
          ],
        ),
      ),
    );
  }

  Widget _btnSendRating(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton.commonButton(title: 'Gửi đánh giá', onTap: controller.sendRating),
    );
  }
}
