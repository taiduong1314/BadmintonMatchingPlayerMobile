
import 'package:get/get.dart';

import '../controller/deposit_withdraw_controller.dart';


class DepositWithdrawBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DepositWithdrawController>(() => DepositWithdrawController());
  }

}