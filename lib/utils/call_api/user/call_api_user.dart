import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/get/user/user_info.dart';
import 'package:vbmsports/api/post/login/login.dart';
import 'package:vbmsports/api/post/rating/rating_user.dart';
import 'package:vbmsports/api/post/user/player_suggestion/player_suggestion.dart';
import 'package:vbmsports/api/post/user/user_area/user_area.dart';
import 'package:vbmsports/api/post/user/user_level/user_level.dart';
import 'package:vbmsports/api/post/user/user_style_play/user_style_play.dart';
import 'package:vbmsports/api/put/change_password/change_password.dart';
import 'package:vbmsports/api/put/forgot_password/forgot_password.dart';
import 'package:vbmsports/api/put/player_suggestion/sub_unsub_player.dart';
import 'package:vbmsports/model/player_suggestion/player_suggestion_model.dart';
import 'package:vbmsports/model/user/user.dart';
import 'package:vbmsports/model/user/user_info.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/set.dart';

import '../../../api/post/register/register.dart';
import '../../../api/put/user/user_info.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIUser {
  static Future<UserDataModel> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await LoginAPI.post(email: email, password: password);

      if (data.data?.token == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản đăng nhập. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return UserDataModel();
      }
      AppDataGlobal.userID = data.data?.id.toString() ?? '';
      return data.data ?? UserDataModel();
    } catch (e) {
      return UserDataModel();
    }
  }

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

      if (data.data?.userId == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      AppDataGlobal.userID = data.data?.userId.toString() ?? '';
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> forgotPassword({
    required String email,
    required String password,
    required String rePassword,
  }) async {
    try {
      var data = await ForgotPasswordAPI.put(
          email: email, newPassword: password, reEnterPassword: rePassword);

      if (data.message == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.errorCode ??
                'Đã xảy ra lỗi trong quá trình cập nhật mật khẩu. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

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

  static Future<List<PlayerSuggestionDataModel>> getPlayerSuggestion(
      {bool isShowError = true}) async {
    try {
      var data = await PlayerSuggestionAPI.get();

      if ((data.data == [] || data.data == null) && isShowError) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: 'Đã xảy ra lỗi trong quá trình gợi ý người chơi',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return [];
    }
  }

  static Future<UserInfoDataModel> getUserInfo({required int userID}) async {
    try {
      var data = await UserInfoAPI.get(userID: userID);

      if (data.data?.fullName == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình gợi ý người chơi',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return UserInfoDataModel();
      }

      return data.data ?? UserInfoDataModel();
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return UserInfoDataModel();
    }
  }

  static Future<bool> updateUserInfo(
      {required String fullName,
      required String userName,
      required String sortProfile,
      required String playingArea,
      required String phoneNumber,
      required String imgBase64}) async {
    try {
      var data = await AccountUpdateAPI.put(
          fullName: fullName,
          userName: userName,
          playingArea: playingArea,
          sortProfile: sortProfile,
          phoneNumber: phoneNumber,
          imgBase64: imgBase64);

      if (data == false) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: 'Đã xảy ra lỗi trong quá trình cập nhật dữ liệu',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return false;
    }
  }

  static Future<bool> changePassword({
    required String password,
    required String rePassword,
  }) async {
    try {
      var data = await ChangePasswordAPI.put(
          password: password, rePassword: rePassword);

      if (data.data == false || data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình cập nhật dữ liệu',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      if (data.data == true) {
        SetDataToLocal.setString(key: KeyDataLocal.passwordKey, data: password);
      }

      return data.data ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return false;
    }
  }

  static Future<bool> subscribePlayer({required String playerID}) async {
    try {
      var data = await SubscribePlayerAPI.put(playerID: playerID);

      if (data.data == false || data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình cập nhật dữ liệu',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data.data ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser subscribePlayer: $e');
      }

      return false;
    }
  }

  static Future<bool> ratingUser({
    required int idUserRated,
    required int levelSkill,
    required int friendly,
    required int trusted,
    required int helpful,
    required String content,
    required int idTransaction,
  }) async {
    try {
      var data = await RatingAPI.post(
          idUserRated: idUserRated,
          levelSkill: levelSkill,
          friendly: friendly,
          trusted: trusted,
          helpful: helpful,
          content: content,
          idTransaction: idTransaction);

      if (data.data == false || data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình đánh giá người dùng',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data.data ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser ratingUser: $e');
      }

      return false;
    }
  }
}
