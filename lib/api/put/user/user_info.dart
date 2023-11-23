
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/common/data.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class AccountUpdateAPI {
  static Future<bool> put(
      {required String fullName,
      required String userName,
        required String playingArea,
      required String sortProfile,
      required String phoneNumber,
      required String imgBase64}) async {
    try {
      var response = await DioClient(Dio())
          .put('${SubAPI.user}/${AppDataGlobal.user.value.id}', data: {
        "userName": userName,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "playingArea": playingArea,
        "sortProfile": sortProfile,
        "imgUrl": imgBase64
      });

      if (kDebugMode) {
        print(
            '******** Status Call API Account Update: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return response.data['data']['statusCode'] == 200;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Account Update: $e');
      }

      return false;
    }
  }
}
