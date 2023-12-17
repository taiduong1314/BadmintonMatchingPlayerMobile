import 'dart:async';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/get.dart';
import '../../../service/firebase/notification/firebase_cloud_messaging.dart';
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
      // var userString =
      //     await GetDataFromLocal.getString(key: KeyDataLocal.userKey);
      //
      // AppDataGlobal.user.value = userString == ''
      //     ? UserDataModel()
      //     : userDataModelFromJson(userString);
      //
      // if (AppDataGlobal.user.value.token != null) isLogin = true;

      String email = await GetDataFromLocal.getString(key: KeyDataLocal.usernameKey);
      String password = await GetDataFromLocal.getString(key: KeyDataLocal.passwordKey);

      if(email != '' && password != '') {
        AppDataGlobal.user.value = await CallAPIUser.login(email: email, password: password);
      }

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
  void onInit() async{
    /// Khi nào dùng push noti thì mở nó lên
    await FirebaseNotification().initConfig();
    await FirebaseNotification().handleMessage();
    /// =====================================
    initLoad();
    super.onInit();
  }
}
