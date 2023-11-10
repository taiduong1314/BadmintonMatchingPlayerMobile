import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../model/date/date_of_week.dart';
import '../../../model/post/post_detail_model.dart';

class BookingController extends GetxController {
  PostDetailDataModel data = Get.arguments['data'];

  RxList<DayOfWeekModel> dateVsSlot = RxList.empty(growable: true);

  RxList<DayOfWeekModel> dateOfWeekSelected = RxList.empty(growable: true);

  Rx<int> currentIndex = (-1).obs;

  @override
  void onInit() {
    dataDemo();
    super.onInit();
  }

  void dataDemo() {
    dateVsSlot.value.add(DayOfWeekModel(date: '${DateTime.now()}', slot: 3));
    dateVsSlot.value.add(DayOfWeekModel(
        date: '${DateTime.now().add(const Duration(days: 1))}', slot: 2));
  }

  void onTapSelectDayOfWeek(DayOfWeekModel data) {
    bool status = isSelectedDayOfWeek(data);

    if (status) {
      removeSelectedDayOfWeek(data);
      return;
    }

    dateOfWeekSelected.add(DayOfWeekModel(date: data.date, slot: 0));
  }

  void removeSelectedDayOfWeek(DayOfWeekModel data) {
    List<DayOfWeekModel> list = dateOfWeekSelected
        .where((value) => value.date == data.date.toString())
        .toList();

    dateOfWeekSelected.remove(list.first);
  }

  Future<void> addSlotSelectedDayOfWeek(
      {required DayOfWeekModel data, required int slot}) async {
    int index = dateOfWeekSelected.indexOf(data);
    dateOfWeekSelected.elementAt(index).slot = slot;
    dateOfWeekSelected.refresh();
  }

  bool isSelectedDayOfWeek(DayOfWeekModel data) {
    try {
      DateTime? date = DateTime.tryParse(data.date!);

      if (date == null) return false;

      List<DayOfWeekModel> list = dateOfWeekSelected
          .where((value) => value.date == date.toString())
          .toList();
      return list.isNotEmpty;
    } catch (e) {
      return true;
    }
  }

  void onTapChoosePaymentMethod(int index) {
    currentIndex.value = index;
  }

  void onTapConfirmPayment() async {
    CustomPopup.showAnimation(Get.context,
        message: 'Quá trình thanh toán \nđang được xử lý',
        spaceAnimationWithText: 20,
        widthAnimation: 100,
        heightAnimation: 100,
        maxLine: 2,
        padding: const EdgeInsets.all(36),
        animationUrl: AssetAnimationCustom.paymentProcessing);
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(Get.context!).pop();
    CustomPopup.showAnimationWithAction(
      Get.context,
      message: 'Thanh toán thành công',
      animationUrl: AssetAnimationCustom.paymentSuccessed,
      titleButton: 'Về Trang Chủ',
      onTap: () => Get.offAllNamed(Routes.MAIN),
    );
  }
}
