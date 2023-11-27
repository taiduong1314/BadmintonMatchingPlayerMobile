

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/common/bool_model.dart';
import '../../../utils/common/data.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class SubscribePlayerAPI {
  static Future<BoolModel> put(
      {required String playerID}) async {
    try {
      var response = await DioClient(Dio())
          .put('${SubAPI.user}/${AppDataGlobal.userID}/sub_unsub/$playerID');

      if (kDebugMode) {
        print(
            '******** Status Call API SubscribePlayerAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API SubscribePlayerAPI: $e');
      }

      return BoolModel();
    }
  }
}
