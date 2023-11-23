
import 'package:get/get.dart';

import '../controller/all_post_controller.dart';

class AllPostBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<AllPostController>(() => AllPostController());
  }
}