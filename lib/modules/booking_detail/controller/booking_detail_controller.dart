import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/booking/call_api_booking.dart';

import '../../../model/booking/booking_detail_model.dart';

class BookingDetailController extends GetxController {
  int bookingID = Get.arguments['id'];
  Rx<BookingDetailDataModel> dataDetail = BookingDetailDataModel().obs;

  @override
  void onInit() {
    handleInit();
    super.onInit();
  }
  void handleInit() {
    getDetail();
  }

  void getDetail() async {
    await EasyLoading.show();
    dataDetail.value = await CallAPIBooking.bookingDetail(bookingID: bookingID);
    await EasyLoading.dismiss();
  }

  void onTapConfirm() async{
    Get.offAllNamed(Routes.MAIN);
  }
}
