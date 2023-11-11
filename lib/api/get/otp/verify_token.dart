import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';

import '../../../model/otp/verify_otp.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class VerifyTokenAPI {
  static Future<BoolModel> check(
      {required String email, required String verifyToken}) async {
    try {
      var response = await DioClient(Dio()).post(SubAPI.verifyToken,
          data: {"verifyToken": verifyToken, "email": email});

      if (kDebugMode) {
        print(
            '******** Status Call API Verify Token: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Verify Token: $e');
      }

      return BoolModel();
    }
  }
}
