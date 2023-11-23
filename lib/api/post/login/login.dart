import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/user/user.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class LoginAPI {
  static Future<UserModel> post({
    required String email,
    required String password,
  }) async {
    try {
      var response = await DioClient(Dio()).post(
        SubAPI.loginEmail,
        data: {
          "email": email,
          "password": password,

        },
      );

      if (kDebugMode) {
        print(
            '******** Status Call API Login: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return userModelFromJson(jsonEncode(response.data));
      }

      return UserModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Login: $e');
      }

      return UserModel();
    }
  }
}
