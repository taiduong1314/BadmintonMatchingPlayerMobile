import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class PostDetailAPI {
  static Future<PostDetailModel> get({required int postID}) async {
    try {
      var response =
          await DioClient(Dio()).get('${SubAPI.post}/$postID/details');

      if (kDebugMode) {
        print(
            '******** Status Call API PostDetailAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return postDetailModelFromJson(jsonEncode(response.data));
      }

      return PostDetailModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API PostDetailAPI : $e');
      }

      return PostDetailModel();
    }
  }
}
