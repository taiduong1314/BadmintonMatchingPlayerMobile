
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';

import '../../../utils/common/asset/animation.dart';
import '../../../utils/widget/popup/custom_popup.dart';

class WalletController extends GetxController{


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