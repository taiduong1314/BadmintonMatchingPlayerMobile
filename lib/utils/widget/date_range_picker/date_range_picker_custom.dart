import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:vbmsports/modules/create_post/controller/create_post_controller.dart';
import 'package:vbmsports/utils/common/button.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

class DateRangePickerCustom extends StatefulWidget {
 final PickerDateRange? initialSelectedRange;


 const DateRangePickerCustom({super.key, this.initialSelectedRange});

  @override
  State<DateRangePickerCustom> createState() => _DateRangePickerCustomState();
}

class _DateRangePickerCustomState extends State<DateRangePickerCustom> {
  PickerDateRange? range;

  void onTapConfirm() {
    if (range?.startDate == null || range?.endDate == null) return;

    var totalDate = range!.endDate!.difference(range!.startDate!).inDays;
    if (totalDate < 0 || totalDate > 6) {
      DateTime? maxDate = range?.startDate?.add(const Duration(days: 6));

      CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message:
              'Phạm vi chọn hiện tại tối đa của bạn là ${Utils.convertDateTime(date: maxDate.toString(), dateFormat: 'dd/MM/yyyy')}',
          titleButton: 'Đã hiểu');
      return;
    }

    // Lấy danh sách các ngày trong phạm vi
    List<DateTime> daysInRange = [];
    DateTime currentDate = range!.startDate!;

    while (currentDate.isBefore(range!.endDate!.add(const Duration(days: 1)))) {
      daysInRange.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    final controller = Get.find<CreatePostController>();
    controller.dateRangeSelected.value = daysInRange;
    controller.dateOfWeekSelected.clear();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfDateRangePicker(
          allowViewNavigation: true,
          selectionMode: DateRangePickerSelectionMode.range,
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 30)),
          onSelectionChanged: (data) {
            range = data.value;
            setState(() {});
          },
        ),
        CustomButton.commonButton(title: 'Chọn phạm vi', onTap: onTapConfirm)
      ],
    );
  }
}
