import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/api/setup_dio/dio_setup.dart';
import 'package:vbmsports/api/url.dart';

import '../../../model/location/location_model.dart';

class DistrictAPI {
  static Future<List<LocationModel>> get({required String keyProvince}) async {
    try {
      var response =
          await DioClient(Dio()).get('${SubAPI.districts}/$keyProvince');

      if (kDebugMode) {
        print(
            '******** Status Call API District: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return locationModelFromJson(jsonEncode(response.data));
      }

      return [];
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API District: $e');
      }

      return [];
    }
  }
}
