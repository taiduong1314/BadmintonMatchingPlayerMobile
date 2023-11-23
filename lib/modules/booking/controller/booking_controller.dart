import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/call_api/booking/call_api_booking.dart';
import 'package:vbmsports/utils/call_api/chat/call_api_chat.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../model/post/post_detail_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/call_api/user/call_api_user.dart';
import '../../../utils/common/asset/animation.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/key_data_local.dart';
import '../../../utils/stored/shared_preferences/get.dart';

class BookingController extends GetxController {
  PostDetailDataModel data = Get.arguments['data'];
  int idPost = Get.arguments['id'];

  RxList<SlotInfo> dateVsSlot = RxList.empty(growable: true);

  RxList<SlotInfo> dateOfWeekSelected = RxList.empty(growable: true);

  Rx<int> currentPaymentMethodIndex = (0).obs;

  @override
  void onInit() {
    setInitData();
    super.onInit();
  }

  void setInitData() {
    dateVsSlot.value = data.slotInfos ?? [];
  }

  void onTapSelectDayOfWeek(SlotInfo data) {
    bool status = isSelectedDayOfWeek(data);

    if (status) {
      removeSelectedDayOfWeek(data);
      return;
    }

    dateOfWeekSelected.add(SlotInfo(
        startTime: data.startTime,
        endTime: data.endTime,
        price: data.price,
        availableSlot: 0));
  }

  void removeSelectedDayOfWeek(SlotInfo data) {
    List<SlotInfo> list = dateOfWeekSelected
        .where((value) => value.startTime == data.startTime.toString())
        .toList();

    dateOfWeekSelected.remove(list.first);
  }

  Future<void> addSlotSelectedDayOfWeek(
      {required SlotInfo data, required int slot}) async {
    int index = dateOfWeekSelected.indexOf(data);
    dateOfWeekSelected.elementAt(index).availableSlot = slot;
    dateOfWeekSelected.refresh();
  }

  bool isSelectedDayOfWeek(SlotInfo data) {
    try {
      List<SlotInfo> list = dateOfWeekSelected
          .where((value) =>
              Utils.convertDateTime(
                  date: value.startTime!, dateFormat: 'dd/MM/yyyy') ==
              Utils.convertDateTime(
                  date: data.startTime!, dateFormat: 'dd/MM/yyyy'))
          .toList();

      return list.isNotEmpty;
    } catch (e) {
      return true;
    }
  }

  void onTapChoosePaymentMethod(int index) {
    currentPaymentMethodIndex.value = index;
  }

  void onTapConfirmPayment() async {
    if (currentPaymentMethodIndex.value == -1) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Vui lòng chọn phương thức thanh toán',
          titleButton: 'Đã hiểu');
      return;
    }

    ///Check slot
    List<SlotInfo> listCheck = [];
    for (var dataInput in dateOfWeekSelected) {
      for (var dataBase in dateVsSlot) {
        if (dataBase.startTime == dataInput.startTime) {
          if (dataInput.availableSlot == -1 ||
              dataInput.availableSlot == 0 ||
              dataBase.availableSlot == -1 ||
              dataBase.availableSlot == 0 ||
              ((dataInput.availableSlot ?? 0) >
                  (dataBase.availableSlot ?? 0))) {
            listCheck.add(dataInput);
          }
        }
      }
    }

    if (listCheck.isNotEmpty) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Vui lòng kiểm tra lại số lượng chỗ của bạn',
          titleButton: 'Đã hiểu');
      return;
    }

    CustomPopup.showAnimation(Get.context,
        message: 'Quá trình thanh toán \nđang được xử lý',
        spaceAnimationWithText: 20,
        widthAnimation: 100,
        heightAnimation: 100,
        maxLine: 2,
        padding: const EdgeInsets.all(36),
        animationUrl: AssetAnimationCustom.paymentProcessing);

    /// Kiểm tra slot còn hay không
    var idBooking = await CallAPIBooking.bookingSlot(
        postId: idPost, slotInfo: dateOfWeekSelected);

    if (idBooking.transactionId == null) {
      Navigator.of(Get.context!).pop();
      return;
    }

    await CallAPIChat.joinChat(roomId: idBooking.chatInfos?.first.roomId ?? -1);

    String email = await GetDataFromLocal.getString(key: KeyDataLocal.usernameKey);
    String password = await GetDataFromLocal.getString(key: KeyDataLocal.passwordKey);

    if(email != '' && password != '') {
      AppDataGlobal.user.value = await CallAPIUser.login(email: email, password: password);
    }

    Navigator.of(Get.context!).pop();

    // joinChat
    ///Tới đây là đã đặt sân thành công
    CustomPopup.showAnimation(Get.context,
        message: 'Thanh toán thành công',
        spaceAnimationWithText: 20,
        maxLine: 2,
        widthAnimation: 200,
        padding: const EdgeInsets.all(20),
        animationUrl: AssetAnimationCustom.paymentSuccessed);
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.of(Get.context!).pop();


    Get.offAndToNamed(Routes.BOOKINGDETAIL, arguments: {"id": idBooking.transactionId});
  }

  int getTotalSlot() {
    int totalSlot = 0;
    for (var element in dateOfWeekSelected) {
      int slot = element.availableSlot == -1 ? 0 : element.availableSlot ?? 0;
      totalSlot += slot;
    }

    return totalSlot;
  }

  int getTotalPayment() {
    int price = 0;
    for (var element in dateOfWeekSelected) {
      int slot = element.availableSlot == -1 ? 0 : element.availableSlot ?? 0;
      int priceDay = element.price == -1 ? 0 : element.price ?? 0;

      price += slot * priceDay;
    }

    return price;
  }
}
