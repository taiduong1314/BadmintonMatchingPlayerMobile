
import 'package:get/get.dart';

import '../controller/new_detail_controller.dart';

class NewDetailBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<NewDetailController>(() => NewDetailController());
  }
}