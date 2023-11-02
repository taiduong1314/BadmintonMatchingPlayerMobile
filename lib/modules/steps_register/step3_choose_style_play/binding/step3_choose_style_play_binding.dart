import 'package:get/get.dart';

import '../controller/step3_choose_style_play_controller.dart';

class Step3RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Step3RegisterController>(() => Step3RegisterController());
  }
}
