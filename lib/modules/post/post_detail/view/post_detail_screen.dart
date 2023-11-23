import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:readmore/readmore.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import 'package:vbmsports/utils/common/asset/svg.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../../../../utils/common/asset/image.dart';
import '../../../../utils/common/color.dart';
import '../../../../utils/widget/loading/load_network_image.dart';
import '../controller/post_detail_controller.dart';

part 'body.dart';
part 'banner.dart';
class PostDetailScreen extends GetView<PostDetailController> {
  const PostDetailScreen({super.key});

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
      height: Get.height / 2.2,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetImageName.splashBackground),
              fit: BoxFit.cover)),
      child: _banner(width: Get.width,
          height: Get.height / 2.2),
    );
  }
}
