import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/comment/comment_model.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class CommentAPI {
  static Future<CommentModel> get({required int userID}) async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.user}/$userID/comments');

      if (kDebugMode) {
        print(
            '******** Status Call API CommentAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return commentModelFromJson(jsonEncode(response.data));
      }

      return CommentModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API CommentAPI : $e');
      }

      return CommentModel();
    }
  }
}
