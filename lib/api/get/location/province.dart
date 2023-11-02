import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/api/setup_dio/dio_setup.dart';
import 'package:vbmsports/api/url.dart';

import '../../../model/location/location_model.dart';

class ProvincesAPI {
  static Future<List<LocationModel>> get() async {
    try {
      var response = await DioClient(Dio()).get(SubAPI.province);

      if (kDebugMode) {
        print(
            '******** Status Call API Province: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return locationModelFromJson(jsonEncode(response.data));
      }

      return [];
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Province: $e');
      }

      return [];
    }
  }
}
