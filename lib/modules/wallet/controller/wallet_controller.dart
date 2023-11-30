
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/wallet/call_api_wallet.dart';

import '../../../model/wallet/history_wallet.dart';
import '../../../utils/common/asset/animation.dart';
import '../../../utils/widget/popup/custom_popup.dart';

class WalletController extends GetxController{

  RxList<HistoryWalletDataModel> listData = RxList.empty(growable: true);
  RxBool isLoadingHistory = true.obs;

  @override
  void onInit() {
    getHistory();
    super.onInit();
  }
  void getHistory() async{
    isLoadingHistory.value = true;
    listData.value = await CallAPIWallet.history();
    isLoadingHistory.value = false;
  }

  void onTapDeposit() async{
    Get.toNamed(Routes.DEPOSITVSWITHDRAW, arguments: {'isDeposit': true});
  }

  void onTapWithDraw() async{
    // Get.toNamed(Routes.DEPOSITVSWITHDRAW, arguments: {'isDeposit': false});
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }
}