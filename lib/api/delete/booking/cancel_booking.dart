import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class CancelBookingAPI {
  static Future<BoolModel> delete({required int bookingID}) async {
    try {
      var response =
      await DioClient(Dio()).delete('${SubAPI.transaction}/$bookingID/discard');

      if (kDebugMode) {
        print(
            '******** Status Call API CancelBookingAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API CancelBookingAPI : $e');
      }

      return BoolModel();
    }
  }
}
