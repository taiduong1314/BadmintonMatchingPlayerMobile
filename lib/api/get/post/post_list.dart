import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/post/post_list_model.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class PostsListAPI {
  static Future<PostsModel> get() async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.post}/GetListPost');

      if (kDebugMode) {
        print(
            '******** Status Call API PostsListAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return postsModelFromJson(jsonEncode(response.data));
      }

      return PostsModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API PostsListAPI : $e');
      }

      return PostsModel();
    }
  }
}
