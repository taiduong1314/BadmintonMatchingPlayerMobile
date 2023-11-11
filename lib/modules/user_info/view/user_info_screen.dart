
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:vbmsports/model/comment/comment_model.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/utils.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/user_info_controller.dart';

part 'header.dart';
part 'body.dart';
part 'input_form_field.dart';

class UserInfoScreen extends GetView<UserInfoController>{
  const UserInfoScreen({super.key});

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
          ],
        ),
      ),
    );
  }
}
