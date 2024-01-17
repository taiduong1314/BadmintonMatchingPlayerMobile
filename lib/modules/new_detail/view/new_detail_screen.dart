import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/new_detail_controller.dart';
import 'package:flutter_html/flutter_html.dart';

part 'body.dart';
part 'header.dart';

class NewDetailScreen extends GetView<NewDetailController> {
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
            Expanded(child: SingleChildScrollView(child: Obx(() {
              controller.fetchingData.value;
              return _body();
            }))),
          ],
        ),
      ),
    );
  }
}
