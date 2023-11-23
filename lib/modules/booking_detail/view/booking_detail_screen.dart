import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/utils.dart';

import '../../../utils/common/text_style.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/booking_detail_controller.dart';

part 'body.dart';

class BookingDetailScreen extends GetView<BookingDetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          if (controller.dataDetail.value.id != null) _body(),
          if (controller.dataDetail.value.id != null)
            Positioned(
                width: Get.width,
                bottom: AppDataGlobal.safeBottom + (Platform.isIOS ? 0 : 10),
                child: Center(child: _btnHome())),
        ],
      ),
    );
  }

  Widget _btnHome() {
    return CustomButton.commonButton(
        title: 'Về trang chủ',
        onTap: controller.onTapConfirm,
        width: Get.width - 48);
  }
}
