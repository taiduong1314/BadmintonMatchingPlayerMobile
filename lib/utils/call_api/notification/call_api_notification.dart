import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/get/notification/user_notification.dart';
import 'package:vbmsports/model/notification/notification_model.dart';

import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPINotifications {
  static Future<List<NotificationDataModel>> getNotification() async {
    try {
      var data = await NotificationsAPI.get();

      if (data.data == [] || data.data == null) {
        await CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: 'Đã xảy ra lỗi trong quá trình cập nhật dữ liệu thông báo',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      if (kDebugMode) {
        print('*************** Error CallAPILocation getProvince: $e');
      }
      return [];
    }
  }
}
