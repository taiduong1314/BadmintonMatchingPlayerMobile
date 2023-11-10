import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/player_suggestion/player_suggestion_model.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../setup_dio/dio_setup.dart';
import '../../../url.dart';

class PlayerSuggestionAPI {
  static Future<PlayerSuggestionModel> get() async {
    try {
      var response = await DioClient(Dio())
          .get('${SubAPI.user}/${AppDataGlobal.userID}/player_suggestion');

      if (kDebugMode) {
        print(
            '******** Status Call API Player Suggestion: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return playerSuggestionModelFromJson(jsonEncode(response.data));
      }

      return PlayerSuggestionModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Player Suggestion: $e');
      }
      return PlayerSuggestionModel();
    }
  }
}
