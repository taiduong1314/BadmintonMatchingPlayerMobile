import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/modules/steps_register/step2_choose_skill/controller/step2_choose_skill_controller.dart';
import 'package:vbmsports/utils/call_api/user/user.dart';

import '../../../../model/player_suggestion/player_suggestion_model.dart';

class Step4RegisterController extends GetxController {
  RxList<PlayerSuggestionModel> playersSuggestion =
      RxList.empty(growable: true);

  final controllerStep1 = Get.find<Step2RegisterController>();

  @override
  void onInit() {
    getPlayerSuggestion();
    super.onInit();
  }

  void getPlayerSuggestion() async {
    playersSuggestion.value = controllerStep1.playersSuggestion;

    if (playersSuggestion.isNotEmpty) {
      return;
    }

    await EasyLoading.show();
    playersSuggestion.value = await CallAPIUser.getPlayerSuggestion();
    await EasyLoading.dismiss();
  }

  void onTapPlayerSuggestion(PlayerSuggestionModel data){}

  void onTapBack() {
    Get.back();
  }

  void onTapNext() async {}

  void onTapFollowPlayer() async {}
}
