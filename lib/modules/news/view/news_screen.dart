
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../model/notification/notification_model.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/news_controller.dart';

part 'banner.dart';

class NewsScreen extends GetView<NewsController>{
  @override
  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _banner(
                  width:  Get.width,
                  height: 260
                ),
                spaceVertical(height: 2),
                Expanded(child: SingleChildScrollView(child: _listItem())),
              ],
            ),
          ),
    );
  }

  Widget _listItem() {
    return controller.isLoading.value
        ? const SizedBox()
        : Column(
        children: [
          spaceVertical(height: 20),
          ...controller.listNotification
              .map((data) => _item(data,
              isEnd: controller.listNotification.last == data))
              .toList(),
          spaceVertical(height: AppDataGlobal.safeBottom),
        ]);
  }

  Widget _item(NotificationDataModel data, {bool isEnd = false}) {
    return GestureDetector(
      onTap: () => controller.onTapDetail(data),
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorLight100, width: 1),
        ),
        child: Row(
          children: [
            NetworkImageCustom.load(
                imageUrl: data.avatar ?? '',
                width: 80,
                height: 120,
                borderRadius: BorderRadius.circular(10),
                fit: BoxFit.cover),
            spaceHorizontal(width: 16),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText.textPlusJakarta(
                        text: data.name ?? '', maxLine: 2,style: TextAppStyle.h6()),
                    spaceVertical(height: 8),
                    // It was perhaps the most emotional meltdown on view at the recent TotalEnergies...
                    CustomText.textPlusJakarta(
                        text: data.content ?? '', maxLine: 3,style: TextAppStyle.bodySmall().copyWith(color: AppColor.colorGrey1)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}