import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../model/post/post_suggestion.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class PostSuggestionAPI {
  static Future<PostSuggestionModel> get() async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.post}/${AppDataGlobal.user.value.id}/post_suggestion');

      if (kDebugMode) {
        print(
            '******** Status Call API PostSuggestionAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return postSuggestionModelFromJson(jsonEncode(response.data));
      }

      return PostSuggestionModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API PostSuggestionAPI : $e');
      }

      return PostSuggestionModel();
    }
  }
}
