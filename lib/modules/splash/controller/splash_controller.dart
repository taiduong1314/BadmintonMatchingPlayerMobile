import 'dart:async';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vbmsports/model/user/user.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/get.dart';
import '../../../utils/common/data.dart';
import '../../../utils/language.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  /// Check load animation of lottie
  bool isLottieLoaded = false;

  /// Check data init load
  bool isInitLoaded = false;

  bool isLogin = false;

  // isLottieLoaded = true and isInitLoaded = true
  // It'll navigate to the next screen

  Future<void> initLoad() async {
    //Get app language
    await _loadInitLanguage();

    try {
      var userString =
          await GetDataFromLocal.getString(key: KeyDataLocal.userKey);

      AppDataGlobal.user.value = userString == ''
          ? UserDataModel()
          : userDataModelFromJson(userString);

      if (AppDataGlobal.user.value.token != null) isLogin = true;
    } catch (_) {}
    isInitLoaded = true;

    if (isLottieLoaded && isInitLoaded) {
      isLogin
          ? Get.offAndToNamed(Routes.MAIN)
          : Get.offAndToNamed(Routes.LOGIN);
    }
  }

  void onLoadedLotie(LottieComposition lottieComposition) async {
    int time = 0;
    do {
      if (lottieComposition.seconds.toInt() == time) {
        isLottieLoaded = true;
        if (isLottieLoaded && isInitLoaded) {
          isLogin
              ? Get.offAndToNamed(Routes.MAIN)
              : Get.offAndToNamed(Routes.LOGIN);
        }
      }

      time += 1;
      await Future.delayed(const Duration(seconds: 1));
    } while (!isLottieLoaded);
  }

  Future<void> _loadInitLanguage() async {
    //Get app language
    await CustomLanguage.getCurrentLang();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initLoad();
    super.onInit();
  }
}
