import 'package:get/get.dart';

import '../controller/rating_user_controller.dart';

class RatingUserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RatingUserController>(() => RatingUserController());
  }
}