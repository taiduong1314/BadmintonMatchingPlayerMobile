import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/post/user/player_suggestion/player_suggestion.dart';
import 'package:vbmsports/api/post/user/user_area/user_area.dart';
import 'package:vbmsports/api/post/user/user_level/user_level.dart';
import 'package:vbmsports/api/post/user/user_style_play/user_style_play.dart';
import 'package:vbmsports/model/player_suggestion/player_suggestion_model.dart';
import 'package:vbmsports/utils/common/data.dart';

import '../../../api/post/register/register.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIUser {
  ///Register new user
  static Future<bool> register({
    required String fullName,
    required String phone,
    required String email,
    required String username,
    required String password,
    required String rePassword,
  }) async {
    try {
      var data = await RegisterAPI.post(
          email: email,
          fullName: fullName,
          password: password,
          rePassword: rePassword,
          phone: phone,
          username: username);

      if (data.userId == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.errorEmail ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      AppDataGlobal.userID = data.userId.toString();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> setUserLevel({required int level}) async {
    try {
      var data = await UserLevelAPI.post(level: level);

      if (kDebugMode) {
        print('********** status setUserLevel: $data');
      }

      return true;
    } catch (e) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message:
              'Đã xảy ra lỗi trong quá trình kiểm tra level tài khoản. Vui lòng thử lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return false;
    }
  }

  static Future<bool> setUserArea({required String area}) async {
    try {
      var data = await UserAreaAPI.post(listArea: [area]);

      if (kDebugMode) {
        print('********** status setUserArea: $data');
      }

      return true;
    } catch (e) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message:
              'Đã xảy ra lỗi trong quá trình kiểm tra khu vực. Vui lòng thử lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return false;
    }
  }

  static Future<bool> setUserStylePlay(
      {required List<String> stylePlay}) async {
    try {
      var data = await UserStylePlayAPI.post(playingWays: stylePlay);

      if (kDebugMode) {
        print('********** status setUserStylePlay: $data');
      }

      return true;
    } catch (e) {
      CustomPopup.showTextWithImage(Get.context,
          title: 'Ôi! Có lỗi xảy ra',
          message:
              'Đã xảy ra lỗi trong quá trình thu thập lối chơi. Vui lòng thử lại',
          titleButton: 'Đã hiểu',
          svgUrl: AssetSVGName.error);
      return false;
    }
  }

  static Future<List<PlayerSuggestionModel>> getPlayerSuggestion({bool isShowError = true}) async {
    try {
      var data = await PlayerSuggestionAPI.get();

      if (data.isEmpty && isShowError) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: 'Đã xảy ra lỗi trong quá trình gợi ý người chơi',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return [];
    }
  }
}
