import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/post/post_list_model.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../../model/post/post_suggestion.dart';
import '../../../../utils/common/asset/svg.dart';
import '../../../../utils/common/color.dart';
import '../../../../utils/common/text_style.dart';
import '../../../../utils/widget/loading/load_network_image.dart';
import '../../../../utils/widget/space/space.dart';
import '../../../../utils/widget/text/montserrat.dart';
import '../controller/all_post_controller.dart';

part 'body.dart';
part 'header.dart';

class AllPostScreen extends GetView<AllPostController> {
  const AllPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        bottom: false,
        child: Container(
          color: AppColor.colorLight,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              _header(),
              spaceVertical(height: 10),
              Expanded(child: SingleChildScrollView(child: _body())),
            ],
          ),
        ),
      ),
    );
  }
}
