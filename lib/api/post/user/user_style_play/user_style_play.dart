
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../setup_dio/dio_setup.dart';
import '../../../url.dart';

class UserStylePlayAPI {
  static Future<bool> post({
    required List<String> playingWays,
  }) async {
    try {
      var response = await DioClient(Dio())
          .post('${SubAPI.user}/${AppDataGlobal.userID}/playing_way', data: {
        "playingWays": playingWays,
      });

      if (kDebugMode) {
        print(
            '******** Status Call API User Style Play: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API User Style Play: $e');
      }
      return false;
    }
  }
}
