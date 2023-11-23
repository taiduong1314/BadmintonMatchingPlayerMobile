import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../model/chat/chats_model.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class RoomsChatAPI {
  static Future<ChatsModel> get() async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.chat}/${AppDataGlobal.user.value.id}/rooms');

      if (kDebugMode) {
        print(
            '******** Status Call API RoomsChatAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return chatsModelFromJson(jsonEncode(response.data));
      }

      return ChatsModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API RoomsChatAPI : $e');
      }

      return ChatsModel();
    }
  }
}
