
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';

class WalletController extends GetxController{


  void onTapDeposit() async{
    Get.toNamed(Routes.DEPOSITVSWITHDRAW, arguments: {'isDeposit': true});
  }

  void onTapWithDraw() async{
    Get.toNamed(Routes.DEPOSITVSWITHDRAW, arguments: {'isDeposit': false});
  }
}