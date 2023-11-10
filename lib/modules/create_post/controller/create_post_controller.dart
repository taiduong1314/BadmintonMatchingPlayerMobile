import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:vbmsports/utils/widget/date_range_picker/date_range_picker_custom.dart';
import 'package:vbmsports/utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';
import 'package:vbmsports/utils/widget/time_picker/time_picker.dart';

import '../../../model/date/date_of_week.dart';
import '../../../utils/common/data.dart';

class CreatePostController extends GetxController {
  TextEditingController txtTitlePost = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  RxList<XFile> imageUploadList = RxList<XFile>();

  RxList<DateTime> dateRangeSelected = RxList.empty(growable: true);

  RxList<DayOfWeekModel> dateOfWeekSelected = RxList.empty(growable: true);

  Rx<DateTime> startTime = DateTime.now().toLocal().obs;
  Rx<DateTime> endTime =
      DateTime.now().toLocal().add(const Duration(hours: 1)).obs;

  @override
  void onInit() {
    handleInit();
    super.onInit();
  }

  void handleInit() {
    startTime.value = startTime.value
        .add(Duration(minutes: autoAddMinute(startTime.value.minute)));
    endTime.value = endTime.value
        .add(Duration(minutes: autoAddMinute(endTime.value.minute)));
  }

  int autoAddMinute(int minute) {
    if (minute > 0 && minute < 15) {
      return 15 - minute;
    } else if (minute > 15 && minute < 30) {
      return 30 - minute;
    } else if (minute > 30 && minute < 45) {
      return 45 - minute;
    } else if (minute > 45 && minute < 60) {
      return 60 - minute;
    }
    return 0;
  }

  Future<void> doOpenGallery() async {
    if (imageUploadList.length == AppDataGlobal.maxImageUpload) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Bạn chỉ được upload tối đa 4 tấm ảnh',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.back();
    final List<XFile> pickedFile = await _picker.pickMultiImage();
    for (int i = 0; i < pickedFile.length; i++) {
      if (isImageUploadLimitReached()) {
        break;
      }
      imageUploadList.add(pickedFile[i]);
    }
  }

  bool isImageUploadLimitReached() {
    return imageUploadList.length - AppDataGlobal.maxImageUpload >= 0;
  }

  void removeUploadedImage(int index) {
    imageUploadList.removeAt(index);
  }

  void onTapTimePicker() async {
    await CommonModalBottomSheet.show(
        isDismissible: false,
        maxHeight: 300,
        customWidget: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: TimePickerCustom(),
        ));
  }

  void onTapDatePicker() async {
    await CommonModalBottomSheet.show(
        isDismissible: false,
        customWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: DateRangePickerCustom(
              initialSelectedRange:
                  PickerDateRange(startTime.value, endTime.value)),
        ));
  }

  void onTapConfirm() async {
    if (txtTitlePost.text == '' ||
        txtAddress.text == '' ||
        txtPrice.text == '' ||
        txtDescription.text == '' ||
        dateOfWeekSelected.isEmpty ||
        imageUploadList.isEmpty) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Vui lòng nhập đầy đủ thông tin',
          titleButton: 'Đã hiểu');
      return;
    }

    List<DayOfWeekModel> listDayOfWeek = dateOfWeekSelected
        .where((value) => value.slot == null || value.slot == -1)
        .toList();

    if (listDayOfWeek.isNotEmpty) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Vui lòng kiểm tra lại thông tin slot của bạn',
          titleButton: 'Đã hiểu');
      return;
    }
  }

  void onTapSelectDayOfWeek(DateTime date) {
    bool status = isSelectedDayOfWeek(date);

    if (status) {
      removeSelectedDayOfWeek(date);
      return;
    }

    dateOfWeekSelected.add(DayOfWeekModel(date: date.toString()));
  }

  void removeSelectedDayOfWeek(DateTime date) {
    List<DayOfWeekModel> list = dateOfWeekSelected
        .where((value) => value.date == date.toString())
        .toList();

    dateOfWeekSelected.remove(list.first);
  }

  Future<void> addSlotSelectedDayOfWeek(
      {required DayOfWeekModel data, required int slot}) async {
    int index = dateOfWeekSelected.indexOf(data);

    dateOfWeekSelected.elementAt(index).slot = slot;
    dateOfWeekSelected.refresh();
  }

  bool isSelectedDayOfWeek(DateTime date) {
    try {
      List<DayOfWeekModel> list = dateOfWeekSelected
          .where((value) => value.date == date.toString())
          .toList();
      return list.isNotEmpty;
    } catch (e) {
      return true;
    }
  }
}
