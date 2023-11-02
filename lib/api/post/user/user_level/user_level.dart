
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../setup_dio/dio_setup.dart';
import '../../../url.dart';

class UserLevelAPI {
  static Future<bool> post({
    required int level,
  }) async {
    try {
      var response = await DioClient(Dio())
          .post('${SubAPI.user}/${AppDataGlobal.userID}/playing_level', data: {
        "point": level,
      });

      if (kDebugMode) {
        print(
            '******** Status Call API User Level: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API User Level: $e');
      }
      return false;
    }
  }
}
