import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/wallet/wallet.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class WalletAPI {
  static Future<WalletModel> put({
    required int balance,
  }) async {
    try {
      var response = await DioClient(Dio())
          .put('${SubAPI.wallet}/${AppDataGlobal.user.value.id}', data: {
        "changes": balance,
      });

      if (kDebugMode) {
        print(
            '******** Status Call API WalletAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return walletModelFromJson(jsonEncode(response.data));
      }

      return WalletModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Wallet API: $e');
      }

      return WalletModel();
    }
  }
}
