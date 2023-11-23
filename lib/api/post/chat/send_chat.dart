import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class SendChatAPI {
  static Future<BoolModel> post(
      {required String message, required int roomId}) async {
    try {
      var response = await DioClient(Dio()).post(
          '${SubAPI.chat}/${AppDataGlobal.user.value.id}',
          data: {"message": message, "roomId": roomId});

      if (kDebugMode) {
        print(
            '******** Status Call API SendChatAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API SendChatAPI : $e');
      }

      return BoolModel();
    }
  }
}
