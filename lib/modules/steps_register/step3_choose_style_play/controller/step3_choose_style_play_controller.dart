import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/call_api/user/call_api_user.dart';
import '../../../../utils/common/asset/svg.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class Step3RegisterController extends GetxController {
  TextEditingController txtStylePlay = TextEditingController();

  List<String> listStyle = [
    "Giành quyền tấn công",
    "Khai thác đường chéo sân",
    "Chiến thuật tấn công cuối sân",
    "Chiến thuật buộc đối thủ đánh cầu trái tay",
    "Chiến thuật ép đối phương đổi hướng liên tục",
    "Chiến thuật đánh vào bốn góc sân",
    "Chiến thuật phòng thủ trước tấn công sau",
    "Thêm cách chơi của bạn",
  ];

  RxList<String> listStyleChoosing = RxList.empty(growable: true);

  RxBool canInput = false.obs;

  void onTapSkill(data) {
    if (listStyleChoosing.contains(data)) {
      listStyleChoosing.remove(data);
    } else {
      listStyleChoosing.add(data);
    }
    canInput.value = listStyleChoosing.contains(listStyle.last);

    if (canInput.isFalse) txtStylePlay.clear();
  }

  void onTapBack() {
    Get.back();
  }

  void onTapNext() async {
    if (listStyleChoosing.isEmpty) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Vui lòng chọn 1 lỗi chơi bất kì',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    if (canInput.isTrue && txtStylePlay.text.trim() == '') {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message: 'Cách chơi đang trống. Vui lòng nhập cách chơi của bạn',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return;
    }

    if (canInput.isTrue) {
      listStyleChoosing.value.remove(listStyle.last);
      listStyleChoosing.add(txtStylePlay.text);
    }

    unawaited(CallAPIUser.setUserStylePlay(stylePlay: listStyleChoosing.value));

    Get.toNamed(Routes.STEP4REGISTER);
  }
}
