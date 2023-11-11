import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';

import '../../../model/otp/verify_otp.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class VerifyOTPAPI {
  static Future<BoolModel> get({required String email}) async {
    try {
      var response =
          await DioClient(Dio()).get('${SubAPI.user}/$email/verify_token');

      if (kDebugMode) {
        print(
            '******** Status Call API Verify OTP: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Verify OTP: $e');
      }

      return BoolModel();
    }
  }
}
