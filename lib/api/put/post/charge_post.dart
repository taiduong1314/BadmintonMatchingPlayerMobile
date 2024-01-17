import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/api/setup_dio/dio_setup.dart';
import 'package:vbmsports/api/url.dart';
import 'package:vbmsports/model/post/boots_charge.dart';
import 'package:vbmsports/utils/common/data.dart';

class CallAPIChargePost {
  static Future<BootsCharge> put() async {
    try {
      var response = await DioClient(Dio())
          .put('${SubAPI.post}/${AppDataGlobal.userID}/create_post_charge');

      if (kDebugMode) {
        print('******** Status Call API Post: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return BootsCharge.fromJson(response.data);
      }

      return BootsCharge();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API SubscribePlayerAPI: $e');
      }

      return BootsCharge();
    }
  }
}
