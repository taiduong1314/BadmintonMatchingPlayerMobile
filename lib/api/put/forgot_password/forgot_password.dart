import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/forgot_password/forgot_pass_model.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class ForgotPasswordAPI {
  static Future<ForgotPasswordModel> put({
    required String email,
    required String newPassword,
    required String reEnterPassword,
  }) async {
    try {
      var response = await DioClient(Dio()).put('${SubAPI.user}/$email/new_pass', data: {
        "newPassword": newPassword,
        "reEnterPassword": reEnterPassword
      });

      if (kDebugMode) {
        print(
            '******** Status Call API Forgot Password: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return forgotPasswordModelFromJson(jsonEncode(response.data));
      }

      return ForgotPasswordModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Forgot Password: $e');
      }

      return ForgotPasswordModel();
    }
  }
}
