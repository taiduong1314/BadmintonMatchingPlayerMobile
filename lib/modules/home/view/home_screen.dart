import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/model/post/post_suggestion.dart';
import 'package:vbmsports/utils/common/asset/svg.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/widget/loading/load_network_image.dart';

import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/home_controller.dart';

part 'header.dart';

part 'body.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _header(),
              spaceVertical(height: 32),
              _title('Sân nổi bật', onTap: controller.onTapViewAllYards),
              spaceVertical(height: 20),
              _body(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _title(text, {Function()? onTap}) {
    return Container(
      color: AppColor.colorLight,
      child: Row(
        children: [
          Expanded(
              child: CustomText.textPlusJakarta(
                  text: text, style: TextAppStyle.h4())),
          if (onTap != null)
            GestureDetector(
                onTap: onTap,
                child: CustomText.textPlusJakarta(
                    text: 'Xem thêm',
                    style: TextAppStyle.bodySmall().copyWith(
                        color: AppColor.colorBlue100.withOpacity(0.8)))),
        ],
      ),
    );
  }
}
