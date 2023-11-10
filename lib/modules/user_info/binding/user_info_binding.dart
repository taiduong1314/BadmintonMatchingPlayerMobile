
import 'package:get/get.dart';

import '../controller/user_info_controller.dart';

class UserInfoBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<UserInfoController>(() => UserInfoController());
  }

}