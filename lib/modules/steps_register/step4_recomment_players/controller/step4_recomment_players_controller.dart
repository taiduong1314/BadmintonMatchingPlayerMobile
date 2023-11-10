import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/modules/steps_register/step2_choose_skill/controller/step2_choose_skill_controller.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../../model/player_suggestion/player_suggestion_model.dart';
import '../../../../model/user/user.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/common/data.dart';
import '../../../../utils/common/key_data_local.dart';
import '../../../../utils/stored/shared_preferences/set.dart';
import '../../../login/controller/login_controller.dart';

class Step4RegisterController extends GetxController {
  RxList<PlayerSuggestionDataModel> playersSuggestion =
  RxList.empty(growable: true);

  final controllerStep1 = Get.find<Step2RegisterController>();

  RxString demoString = ''.obs;

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

  void onTapPlayerSuggestion(PlayerSuggestionDataModel data) {}

  void onTapBack() {
    Get.back();
  }

  void onTapNext() async {
    await CustomPopup.showAnimationWithAction(Get.context, message: 'Thành công',
        animationUrl: AssetAnimationCustom.registerSuccess,
        repeatAnimation: false,
        padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
        onTap: () async{
          await EasyLoading.show();
          final controllerLogin = Get.find<LoginController>();
          UserDataModel data = await CallAPIUser.login(
              email: controllerLogin.txtEmail.text, password: controllerLogin.txtPassword.text);
          await EasyLoading.dismiss();

          if (data.token == null) return;

          AppDataGlobal.user.value = data;
          SetDataToLocal.setString(
              key: KeyDataLocal.userKey, data: userDataModelToJson(data));

          Get.offAllNamed(Routes.MAIN);
        },
        titleButton: 'Trải nghiệm ngay');
  }

  void onTapFollowPlayer() async {}
}
