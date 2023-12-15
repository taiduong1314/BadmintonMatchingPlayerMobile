
import 'package:get/get.dart';

import '../controller/confirm_password_controller.dart';

class ConfirmPasswordBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ConfirmPasswordController>(() => ConfirmPasswordController());
  }

}