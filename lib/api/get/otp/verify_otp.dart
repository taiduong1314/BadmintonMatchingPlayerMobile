import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/otp/verify_otp.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class VerifyOTPAPI {
  static Future<VerifyOtpModel> get({required String email}) async {
    try {
      var response =
          await DioClient(Dio()).get('${SubAPI.user}/$email/verify_otp');

      if (kDebugMode) {
        print(
            '******** Status Call API Verify OTP: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return verifyOtpModelFromJson(jsonEncode(response.data));
      }

      return VerifyOtpModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Verify OTP: $e');
      }

      return VerifyOtpModel();
    }
  }
}
