import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../model/post/post_list_posted.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class PostedPostsAPI {
  static Future<PostedPostsModel> get() async {
    try {
      var response =
      await DioClient(Dio()).get('${SubAPI.post}/${AppDataGlobal.user.value.id}/managed_all_post');

      if (kDebugMode) {
        print(
            '******** Status Call API PostedPostsAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return postedPostsModelFromJson(jsonEncode(response.data));
      }

      return PostedPostsModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API PostedPostsAPI : $e');
      }

      return PostedPostsModel();
    }
  }
}
