import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/wallet/history_wallet.dart';
import 'package:vbmsports/model/wallet/wallet.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class HistoryWalletAPI {
  static Future<HistoryWalletModel> get() async {
    try {
      var response = await DioClient(Dio())
          .get('${SubAPI.wallet}/user/${AppDataGlobal.user.value.id}/history');

      if (kDebugMode) {
        print(
            '******** Status Call API HistoryWalletAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return historyWalletModelFromJson(jsonEncode(response.data));
      }

      return HistoryWalletModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API HistoryWalletAPI: $e');
      }

      return HistoryWalletModel();
    }
  }
}
