import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/get.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class ChangePasswordAPI {
  static Future<BoolModel> put({
    required String password,
    required String rePassword,
  }) async {
    try {
      String email = await GetDataFromLocal.getString(key: KeyDataLocal.usernameKey);

      var response = await DioClient(Dio()).put(
          '${SubAPI.user}/$email/new_pass',
          data: {"newPassword": password, "reEnterPassword": rePassword});

      if (kDebugMode) {
        print(
            '******** Status Call API Account Update: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Account Update: $e');
      }

      return BoolModel();
    }
  }
}
