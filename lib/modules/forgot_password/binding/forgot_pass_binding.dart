
import 'package:get/get.dart';

import '../controller/forgot_pass_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }

}