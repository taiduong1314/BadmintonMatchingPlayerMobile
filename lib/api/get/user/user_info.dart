import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/user/user_info.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class UserInfoAPI {
  static Future<UserInfoModel> get({required int userID}) async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.user}/$userID/profile');

      if (kDebugMode) {
        print(
            '******** Status Call API UserInfoAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return userInfoModelFromJson(jsonEncode(response.data));
      }

      return UserInfoModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API UserInfoAPI : $e');
      }

      return UserInfoModel();
    }
  }
}
