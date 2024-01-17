import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/api/setup_dio/dio_setup.dart';
import 'package:vbmsports/api/url.dart';
import 'package:vbmsports/model/common/bool_model.dart';

class CallApiSetting {
  static Future get() async {
    try {
      var response =
          await DioClient(Dio()).get('${SubAPI.setting}/get_listSetting');

      if (kDebugMode) {
        print(
            '******** Status Call API UserInfoAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return response.data;
      }

      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API UserInfoAPI : $e');
      }

      return BoolModel();
    }
  }
}
