import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/booking/booking_detail_model.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class BookingDetailAPI {
  static Future<BookingDetailModel> get({required int bookingID}) async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.transaction}/$bookingID/detail');

      if (kDebugMode) {
        print(
            '******** Status Call API BookingDetailAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return bookingDetailModelFromJson(jsonEncode(response.data));
      }

      return BookingDetailModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API BookingDetailAPI : $e');
      }

      return BookingDetailModel();
    }
  }
}
