
import 'package:get/get.dart';

import '../controller/manage_posted_post_controller.dart';

class ManagePostedPostBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ManagePostedPostController>(() => ManagePostedPostController());
  }
}