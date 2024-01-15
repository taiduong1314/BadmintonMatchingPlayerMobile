import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vbmsports/model/notification/notification_model.dart';
import 'package:vbmsports/utils/common/asset/svg.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/widget/loading/load_network_image.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../../../utils/common/color.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(height: 16),
              _title(),
              spaceVertical(height: 20),
              Expanded(child: SingleChildScrollView(child: _listItem())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return GestureDetector(
      onTap: Get.back,
      child: Row(
        children: [
          SvgPicture.asset(AssetSVGName.arrowLeft),
          CustomText.textPlusJakarta(
              text: 'Thông báo', style: TextAppStyle.h4()),
        ],
      ),
    );
  }

  Widget _listItem() {
    return controller.isLoading.value
        ? const SizedBox()
        : Column(
            children: controller.listNotification
                .map((data) => _item(data,
                    isEnd: controller.listNotification.last == data))
                .toList());
  }

  Widget _item(NotificationDataModel data, {bool isEnd = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          spaceVertical(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              NetworkImageCustom.load(
                  imageUrl: data.avatar ?? '',
                  width: 56,
                  height: 56,
                  borderRadius: BorderRadius.circular(1000)),
              spaceHorizontal(width: 8),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '${data.name ?? ''} ',
                              style: TextAppStyle.size14W600()),
                          TextSpan(
                              text: data.content ?? '',
                              style: TextAppStyle.size14W400()),
                        ],
                      ),
                    ),
                  ),
                  spaceVertical(height: 4),
                  CustomText.textPlusJakarta(
                      text: data.notiDate ?? Jiffy.parse('${DateTime.now().subtract(const Duration(days: 1))}')
                          .fromNow(),
                      style: TextAppStyle.size12W400())
                ],
              )),
            ],
          ),
          spaceVertical(height: 16),
          if (!isEnd)
            Divider(
                height: 0.5, color: AppColor.colorTextGrey20.withOpacity(0.5)),
        ],
      ),
    );
  }
}
