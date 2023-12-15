import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/common/bool_model.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class RatingAPI {
  static Future<BoolModel> post({
    required int idUserRated,
    required int levelSkill,
    required int friendly,
    required int trusted,
    required int helpful,
    required String content,
    required int idTransaction,
  }) async {
    try {
      var response = await DioClient(Dio()).post(SubAPI.ratingUser, data: {
        "idUserRate": AppDataGlobal.user.value.id,
        "idUserRated": idUserRated,
        "levelSkill": levelSkill,
        "friendly": friendly,
        "trusted": trusted,
        "helpful": helpful,
        "content": content,
        "idTransaction": idTransaction
      });

      if (kDebugMode) {
        print(
            '******** Status Call API RatingAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return boolModelFromJson(jsonEncode(response.data));
      }

      return BoolModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API RatingAPI: $e');
      }

      return BoolModel();
    }
  }
}
