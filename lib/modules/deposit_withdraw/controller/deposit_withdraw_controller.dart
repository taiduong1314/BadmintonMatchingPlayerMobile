import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/call_api/wallet/call_api_wallet.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import '../../../utils/widget/web_view/web_view.dart';

class DepositWithdrawController extends GetxController {
  bool isDeposit = Get.arguments['isDeposit'];

  TextEditingController txtBalance = TextEditingController();

  void onTapConfirm() async {
    int balance = int.tryParse(txtBalance.text) ?? -1;
    if (balance == -1 || balance < 10000) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message:
              'Vui lòng kiểm tra lại số tiền muốn ${isDeposit ? 'nạp' : 'rút'}',
          titleButton: 'Đã hiểu');
      return;
    }

    await CustomPopup.showWithAction(Get.context,
        title: isDeposit ? 'Nạp tiền' : 'Rút tiền',
        message:
            'Xác nhận ${isDeposit ? 'nạp' : 'rút'} ${Utils.formatBalance(txtBalance.text)}đ',
        titleButtonLeft: 'Suy nghĩ lại',
        titleButtonRight: 'Đồng ý',
        onTapRight: isDeposit ? doDeposit : doWithDraw);
  }

  void doDeposit() async {
    int balance = int.tryParse(txtBalance.text) ?? -1;

    if (balance == -1) return;

    CustomPopup.showAnimation(Get.context,
        message: 'Quá trình thanh toán \nđang được xử lý',
        spaceAnimationWithText: 20,
        widthAnimation: 100,
        heightAnimation: 100,
        maxLine: 2,
        padding: const EdgeInsets.all(36),
        animationUrl: AssetAnimationCustom.paymentProcessing);

    String urlPayment = await CallAPIWallet.vnpayLink(balance: balance);

    if (urlPayment == '' || !Utils.isURL(urlPayment)) {
      Navigator.of(Get.context!).pop();
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Đã có lỗi xảy ra trong quá trình kết nối VN-Pay',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    bool? status = await CommonModalBottomSheet.show(
        customWidget: WebViewCustom(url: urlPayment),
        maxHeight: Get.height,
        isScrollControlled: true);

    if (status == null || status == false) {
      Navigator.of(Get.context!).pop();
      CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Đã xảy ra lỗi trong quá trình thanh toán',
          titleButton: 'Đã hiểu');
      return;
    }

    int balanceNew = await CallAPIWallet.deposit(balance: balance);
    AppDataGlobal.user.value.balance =
        double.tryParse('${balanceNew == -1 ? 0 : balanceNew}');
    AppDataGlobal.user.refresh();

    Navigator.of(Get.context!).pop();
    CustomPopup.showAnimationWithAction(Get.context,
        message: 'Nạp tiền thành công',
        animationUrl: AssetAnimationCustom.paymentSuccessed,
        titleButton: 'Về ví',
        onTap: Get.back);
  }

  void doWithDraw() async {
    int balance = int.tryParse(txtBalance.text) ?? -1;

    if (balance == -1) return;

    CustomPopup.showAnimation(Get.context,
        message: 'Quá trình thanh toán \nđang được xử lý',
        spaceAnimationWithText: 20,
        widthAnimation: 100,
        heightAnimation: 100,
        maxLine: 2,
        padding: const EdgeInsets.all(36),
        animationUrl: AssetAnimationCustom.paymentProcessing);
    int balanceNew = await CallAPIWallet.deposit(balance: -balance);

    AppDataGlobal.user.value.balance =
        double.tryParse('${balanceNew == -1 ? 0 : balanceNew}');
    AppDataGlobal.user.refresh();

    Navigator.of(Get.context!).pop();
    CustomPopup.showAnimationWithAction(Get.context,
        message: 'Rút tiền thành công',
        animationUrl: AssetAnimationCustom.paymentSuccessed,
        titleButton: 'Về ví',
        onTap: Get.back);
  }
}
