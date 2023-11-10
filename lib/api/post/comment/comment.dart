import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';
import 'package:vbmsports/utils/common/data.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class SendCommentAPI {
  static Future<BoolModel> post(
      {required int userIDReceive, String? content}) async {
    try {
      var response = await DioClient(Dio()).post(
          '${SubAPI.user}/${AppDataGlobal.user.value.id}/comments/$userIDReceive',
          data: {
            "content": content,
          });

      if (kDebugMode) {
        print(
            '******** Status Call API SendCommentAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API SendCommentAPI : $e');
      }

      return BoolModel();
    }
  }
}
