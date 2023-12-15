import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../model/user/user_info.dart';

class RatingUserController extends GetxController {
  int userID = Get.arguments['id'];
  int idTransaction = Get.arguments['idTransaction'];
  UserInfoDataModel dataUser = Get.arguments['data'];

  TextEditingController txtMessage = TextEditingController();

  RxDouble levelSkill = 5.0.obs;
  RxDouble friendly = 5.0.obs;
  RxDouble trusted = 5.0.obs;
  RxDouble helpful = 5.0.obs;

  void sendRating() async {
    await EasyLoading.show();
    bool status = await CallAPIUser.ratingUser(
        idUserRated: userID,
        levelSkill: levelSkill.value.toInt(),
        friendly: friendly.value.toInt(),
        trusted: trusted.value.toInt(),
        helpful: helpful.value.toInt(),
        content: txtMessage.text,
        idTransaction: idTransaction);
    await EasyLoading.dismiss();

    if (!status) return;
    CustomPopup.showAnimationWithAction(Get.context,
        message: 'Gửi đánh giá thành công',
        animationUrl: AssetAnimationCustom.paymentSuccessed,
        repeatAnimation: false,
        titleButton: 'Đã hiểu');

    Get.offAllNamed(Routes.MAIN);
  }
}
