import 'package:get/get.dart';

import '../controller/step1_choose_districts_controller.dart';

class Step1RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Step1RegisterController>(() => Step1RegisterController());
  }
}
