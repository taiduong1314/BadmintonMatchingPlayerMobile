
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../model/wallet/vnpay.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class VNPayAPI {
  static Future<VnPayModel> post({
    required int balance,
  }) async {
    try {
      var response = await DioClient(Dio()).post(
        SubAPI.vnpay,
        data: {
          "changes": balance,
          "userId": AppDataGlobal.user.value.id
        },
      );

      if (kDebugMode) {
        print(
            '******** Status Call API VNPayAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return vnPayModelFromJson(jsonEncode(response.data));
      }

      return VnPayModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API VNPayAPI: $e');
      }

      return VnPayModel();
    }
  }
}