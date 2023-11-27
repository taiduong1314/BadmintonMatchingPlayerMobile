

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/post/post_suggestion.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class PlayGroundAPI {
  static Future<PostSuggestionModel> get({
    required int locationID
}) async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.playGround}/$locationID');

      if (kDebugMode) {
        print(
            '******** Status Call API PlayGroundAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return postSuggestionModelFromJson(jsonEncode(response.data));
      }

      return PostSuggestionModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API PlayGroundAPI : $e');
      }

      return PostSuggestionModel();
    }
  }
}
