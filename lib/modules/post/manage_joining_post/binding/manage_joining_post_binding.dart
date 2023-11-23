
import 'package:get/get.dart';

import '../controller/manage_joining_post_controller.dart';

class ManageJoiningPostBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ManageJoiningPostController>(() => ManageJoiningPostController());
  }
}