import 'package:get/get.dart';

import '../controller/step4_recomment_players_controller.dart';

class Step4RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Step4RegisterController>(() => Step4RegisterController());
  }
}
