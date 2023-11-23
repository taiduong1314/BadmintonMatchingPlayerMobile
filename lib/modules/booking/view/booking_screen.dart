import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/utils.dart';
import '../controller/booking_controller.dart';

part 'header.dart';
part 'input_form_field.dart';
part 'body.dart';

class BookingScreen extends GetView<BookingController> {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _header(),
            spaceVertical(height: 10),
            Expanded(child: SingleChildScrollView(child: _body())),
          ],
        ),
      ),
    );
  }
}
