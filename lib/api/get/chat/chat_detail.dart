import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../model/chat/list_chat_detail.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class ChatDetailAPI {
  static Future<ListChatDetailModel> get(
      {required int roomId, required int pageNum, required pageSize}) async {
    try {
      var response = await DioClient(Dio())
          .get('${SubAPI.chatDetail}/$roomId/detail', queryParameters: {
        'pageSize': pageSize,
        'pageNum': pageNum,
      });

      if (kDebugMode) {
        print(
            '******** Status Call API ChatDetailAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return listChatDetailModelFromJson(jsonEncode(response.data));
      }

      return ListChatDetailModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API ChatDetailAPI : $e');
      }

      return ListChatDetailModel();
    }
  }
}
