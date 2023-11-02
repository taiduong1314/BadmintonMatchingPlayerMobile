import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class Step2RegisterController extends GetxController {
  RxList listSkills = RxList.empty(growable: true);

  RxString skillSelected = ''.obs;

  void getSkills(){
  }
  void onTapSkill(data) {}

  void onTapBack() {
    Get.back();
  }

  void onTapNext() {
    Get.toNamed(Routes.STEP3REGISTER);
  }
}
