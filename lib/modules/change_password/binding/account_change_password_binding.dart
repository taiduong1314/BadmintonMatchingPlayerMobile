
import 'package:get/get.dart';

import '../controller/account_change_password_controller.dart';

class AccountChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccountChangePasswordController>(() => AccountChangePasswordController());
  }

}