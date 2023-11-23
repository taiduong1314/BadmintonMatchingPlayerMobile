
import 'package:get/get.dart';
import 'package:vbmsports/api/get/booking/booking_detail.dart';
import 'package:vbmsports/model/booking/booking_detail_model.dart';
import 'package:vbmsports/model/post/available_slot_model.dart';

import '../../../api/post/posts/booking_slot.dart';
import '../../../model/post/post_detail_model.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIBooking{
  static Future<AvailableSlotDataModel> bookingSlot({
    required int postId,
    required List<SlotInfo> slotInfo,
  }) async {
    try {
      var data = await CheckSlotAPI.post(postId: postId, slotInfo: slotInfo);

      if (data.data?.transactionId == null || data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm số lượng chỗ đặt sân. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return AvailableSlotDataModel();
      }

      return data.data ?? AvailableSlotDataModel();
    } catch (e) {
      return AvailableSlotDataModel();
    }
  }

  static Future<BookingDetailDataModel> bookingDetail({
    required int bookingID,
  }) async {
    try {
      var data = await BookingDetailAPI.get(bookingID: bookingID);

      if (data.data?.id == null || data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm số lượng chỗ đặt sân. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return BookingDetailDataModel();
      }

      return data.data ?? BookingDetailDataModel();
    } catch (e) {
      return BookingDetailDataModel();
    }
  }
}