import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import 'package:vbmsports/modules/create_post/controller/create_post_controller.dart';
import 'package:vbmsports/utils/common/color.dart';
import 'package:vbmsports/utils/common/text_style.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/text/montserrat.dart';

import '../../common/button.dart';
import '../popup/custom_popup.dart';

class TimePickerCustom extends StatefulWidget {
  SlotInfo date;

  TimePickerCustom({super.key, required this.date});

  @override
  State<TimePickerCustom> createState() => _TimePickerCustomState();
}

class _TimePickerCustomState extends State<TimePickerCustom> {
  DateTime? startDate, endDate;

  void onTapConfirm() {
    if (startDate == null || endDate == null) return;

    if (startDate!.isAfter(endDate!)) {
      CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Giờ kết thúc phải lớn hơn giờ bắt đầu. Kiểm tra lại',
          titleButton: 'Đã hiểu');
      return;
    }

    Duration duration = endDate!.difference(startDate!);

    if (duration.inHours < 1) {
      CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Tổng số giờ chơi phải lớn hơn > 1h',
          titleButton: 'Đã hiểu');
      return;
    }

    final controller = Get.find<CreatePostController>();
    controller.addStartEndSelectedDayOfWeek(
        data: widget.date,
        startTime:
            Utils.convertDateTime(date: '$startDate', dateFormat: 'HH:mm'),
        endTime: Utils.convertDateTime(date: '$endDate', dateFormat: 'HH:mm'));

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: Get.width,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.textPlusJakarta(text: 'Giờ chơi'),
              spaceHorizontal(width: 10),
              TimePickerSpinner(
                is24HourMode: true,
                minutesInterval: 15,
                itemHeight: 35,
                itemWidth: 30,
                normalTextStyle:
                    TextAppStyle.bodyDefault().copyWith(fontSize: 20),
                highlightedTextStyle: TextAppStyle.bodyDefault().copyWith(
                    color: AppColor.colorDark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                onTimeChange: (date) {
                  startDate = date;
                  setState(() {});
                },
              ),
              const Spacer(),
              CustomText.textPlusJakarta(text: 'Giờ kết thúc'),
              spaceHorizontal(width: 10),
              TimePickerSpinner(
                is24HourMode: true,
                minutesInterval: 15,
                itemHeight: 35,
                itemWidth: 30,
                normalTextStyle:
                    TextAppStyle.bodyDefault().copyWith(fontSize: 20),
                highlightedTextStyle: TextAppStyle.bodyDefault().copyWith(
                    color: AppColor.colorDark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                onTimeChange: (date) {
                  endDate = date;
                  setState(() {});
                },
              ),
            ],
          ),
          CustomButton.commonButton(title: 'Xác nhận', onTap: onTapConfirm),
        ],
      ),
    );
  }
}
