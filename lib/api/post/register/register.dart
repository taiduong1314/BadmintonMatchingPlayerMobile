import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/user_id/user_id.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class RegisterAPI {
  static Future<UserIdModel> post({
    required String fullName,
    required String phone,
    required String email,
    required String username,
    required String password,
    required String rePassword,
  }) async {
    try {
      var response = await DioClient(Dio()).post(
        SubAPI.register,
        data: {
          "fullName": fullName,
          "phoneNum": phone,
          "email": email,
          "password": password,
          "reEnterPass": rePassword,
          "userName": username
        },
      );

      if (kDebugMode) {
        print(
            '******** Status Call API Register: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return userIdModelFromJson(jsonEncode(response.data));
      }

      return UserIdModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Register: $e');
      }

      return UserIdModel();
    }
  }
}
