import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/booking/call_api_booking.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';

import '../../../../model/post/post_detail_model.dart';
import '../../../../utils/common/asset/animation.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class PostDetailController extends GetxController {
  PostDetailDataModel dataDetail = Get.arguments['data'];
  int id = Get.arguments['id'];
  RxInt indexBanner = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTapHostProfile() async {
    if (dataDetail.userId == null) return;

    await EasyLoading.show();
    var data = await CallAPIUser.getUserInfo(userID: dataDetail.userId!);
    await EasyLoading.dismiss();
    Get.toNamed(Routes.USERINFO,
        arguments: {"id": dataDetail.userId!, "data": data});
  }

  void onTapBooking() {
    Get.toNamed(Routes.BOOKING, arguments: {"data": dataDetail, 'id': id});
  }

  void onTapReport() async {
    if (dataDetail.userId == null) return;

    await EasyLoading.show();
    var data = await CallAPIUser.getUserInfo(userID: dataDetail.userId!);
    await EasyLoading.dismiss();
    Get.toNamed(Routes.RATINGUSER,
        arguments: {"id": dataDetail.userId!, "data": data, 'idTransaction': dataDetail.transacionId});
  }

  void onTapBill() async {
    if (dataDetail.transacionId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy mã giao dịch. Vui lòng thử lại',
          titleButton: 'Đã hiểu');
      return;
    }
    Get.toNamed(Routes.BOOKINGDETAIL,
        arguments: {"id": dataDetail.transacionId});
  }

  void onTapOptional({required int id}) async {
    ///id 0: Chat
    ///id 1: huỷ đặt sân

    if (dataDetail.canReport == true && id == 1) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Đã quá thời gian để huỷ đặt sân',
          titleButton: 'Đã hiểu');
      return;
    }

    switch (id) {
      case 0:
        chatGroup();
        break;
      case 1:
        cancelBooking();
        break;
    }
  }

  void cancelBooking() async {
    if (dataDetail.isCancel != true) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Đã quá thời gian huỷ sân. Bạn không thể huỷ sân lúc này',
          titleButton: 'Đã hiểu');
      return;
    }

    await CustomPopup.showWithAction(
      Get.context,
      title: 'Hủy đặt chỗ',
      message: 'Bạn có chắc chắn muốn huỷ đặt chỗ không?',
      titleButtonLeft: 'Có',
      titleButtonRight: 'Suy nghĩ lại',
      onTapLeft: () async {
        await EasyLoading.show();
        bool status = await CallAPIBooking.cancelBooking(
            bookingID: dataDetail.transacionId ?? -1);
        await EasyLoading.dismiss();
        if (!status) return;

        CustomPopup.showOnlyText(Get.context,
            title: 'Thông báo',
            message: 'Đã huỷ sân thành công',
            titleButton: 'Đã hiểu');
        Get.offAllNamed(Routes.MAIN);
      },
    );
  }

  void chatGroup() async {
    // await CustomPopup.showAnimationWithAction(Get.context,
    //     message: "Tính năng đang được phát triển vui lòng quay lại sau",
    //     titleButton: "Đã hiểu",
    //     maxLineMessage: 3,
    //     repeatAnimation: true,
    //     animationUrl: AssetAnimationCustom.crying);

    int roomID = int.tryParse(dataDetail.chatRoomUrl?.substring(
                (dataDetail.chatRoomUrl?.indexOf('id=') ?? 0) + 3) ??
            '') ??
        -1;

    if (roomID == -1) {
      CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message:
              'Bạn chưa thể vào room chat ngay bây giờ. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.CHATDETAIL, arguments: {
      'id': roomID,
      'roomName': 'Trò chuyện nhóm',
      'clientUrl': dataDetail.chatRoomUrl
    })?.then((value) {});
  }
}
