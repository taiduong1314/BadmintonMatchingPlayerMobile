import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/api/setup_dio/dio_setup.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../model/notification/notification_model.dart';

class NotificationsAPI {
  static Future<NotificationsModel> get() async {
    try {
      var response = await DioClient(Dio()).get(
          'api/users/${AppDataGlobal.user.value.id}/notification');

      if (kDebugMode) {
        print(
            '******** Status Call API Notification: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('${response.data}');
        }

        return notificationsModelFromJson(jsonEncode(response.data));
      }

    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Notification: $e');
      }
    }

    return NotificationsModel();
  }
}
