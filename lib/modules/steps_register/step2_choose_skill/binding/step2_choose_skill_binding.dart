import 'package:get/get.dart';

import '../controller/step2_choose_skill_controller.dart';

class Step2RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Step2RegisterController>(() => Step2RegisterController());
  }
}
