import 'dart:async';

import 'package:get/get.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';

import '../../../../model/player_suggestion/player_suggestion_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/common/asset/svg.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class Step2RegisterController extends GetxController {
  List<String> listSkills = [
    "Lần đầu chơi",
    "Mới chơi",
    "Có kinh nghiệm",
    "Chuyên gia",
    "Tuyển thủ"
  ];

  RxString skillSelected = ''.obs;


  /// Gọi dữ liệu chuẩn bị cho step 4
  /// Làm vậy cho mượt hơn
  List<PlayerSuggestionDataModel> playersSuggestion = [];

  @override
  void onInit() {
    unawaited(getPlayerSuggestion());
    super.onInit();
  }

  Future<void> getPlayerSuggestion() async {
    playersSuggestion = await CallAPIUser.getPlayerSuggestion(isShowError: false);
  }


  void onTapSkill(data) {
    skillSelected.value = data;
  }

  void onTapBack() {
    Get.back();
  }

  void onTapNext() async {
    if (skillSelected.value == '') {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Vui lòng chọn 1 kỹ năng bất kỳ',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }
    unawaited(CallAPIUser.setUserLevel(
        level: listSkills.indexOf(skillSelected.value)));
    Get.toNamed(Routes.STEP3REGISTER);
  }
}
