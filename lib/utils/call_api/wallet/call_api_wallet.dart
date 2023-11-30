import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/get/wallet/history_wallet.dart';
import 'package:vbmsports/api/post/payment/vn-pay.dart';
import 'package:vbmsports/api/put/wallet/wallet.dart';

import '../../../model/wallet/history_wallet.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIWallet {
  static Future<int> deposit({
    required int balance,
  }) async {
    try {
      var data = await WalletAPI.put(balance: balance);

      if (data.data?.newBalance == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá thực hiện giao dịch',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return -1;
      }

      return data.data?.newBalance ?? -1;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser deposit: $e');
      }

      return -1;
    }
  }

  static Future<String> vnpayLink({
    required int balance,
  }) async {
    try {
      var data = await VNPayAPI.post(balance: balance);

      return data.data?.uri ?? '';
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser deposit: $e');
      }

      return '';
    }
  }

  static Future<List<HistoryWalletDataModel>> history() async {
    try {
      var data = await HistoryWalletAPI.get();

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá thực hiện giao dịch',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser deposit: $e');
      }

      return [];
    }
  }
}
