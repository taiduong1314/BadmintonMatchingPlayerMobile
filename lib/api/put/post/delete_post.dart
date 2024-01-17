import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/api/setup_dio/dio_setup.dart';
import 'package:vbmsports/api/url.dart';
import 'package:vbmsports/model/common/bool_model.dart';

class CallAPIDeletePost {
  static Future put(int postId) async {
    try {
      var response =
          await DioClient(Dio()).put('${SubAPI.post}/1/delete/$postId');

      if (kDebugMode) {
        print('******** Status Call API Post: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return true;
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API SubscribePlayerAPI: $e');
      }

      return BoolModel();
    }
  }
}
