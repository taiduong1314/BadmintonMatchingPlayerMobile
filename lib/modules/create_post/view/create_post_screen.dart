import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/date/date_of_week.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/utils.dart';

import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../../../utils/widget/uploaded_image_preview/uploaded_image_preview.dart';
import '../controller/create_post_controller.dart';

part 'body.dart';
part 'input_form_field.dart';

class CreatePostScreen extends GetView<CreatePostController> {
  CreatePostScreen({super.key});

  @override
  final controller = Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVertical(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _title(),
            ),
            spaceVertical(height: 20),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return CustomText.textPlusJakarta(
        text: 'Đăng tin', style: TextAppStyle.h4());
  }
}
