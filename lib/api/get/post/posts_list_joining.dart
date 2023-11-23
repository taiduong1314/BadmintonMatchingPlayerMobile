
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/post/post_list_joining.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class JoiningPostsAPI {
  static Future<JoinedPostsModel> get() async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.post}/user/${AppDataGlobal.user.value.id}/joined');

      if (kDebugMode) {
        print(
            '******** Status Call API JoiningPostsAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return joinedPostsModelFromJson(jsonEncode(response.data));
      }

      return JoinedPostsModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API JoiningPostsAPI : $e');
      }

      return JoinedPostsModel();
    }
  }
}
