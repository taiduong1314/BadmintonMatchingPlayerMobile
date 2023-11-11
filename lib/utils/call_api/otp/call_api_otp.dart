import 'package:get/get.dart';
import 'package:vbmsports/api/get/otp/verify_otp.dart';
import 'package:vbmsports/api/get/otp/verify_token.dart';
import 'package:vbmsports/model/otp/verify_otp.dart';

import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIOTP {
  static Future<bool> send({
    required String email,
  }) async {
    try {
      var data = await VerifyOTPAPI.get(email: email);

      if (data.data == null || data.data == false) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản đăng nhập. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data.data ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> check(
      {required String email, required String verifyToken}) async {
    try {
      var data = await VerifyTokenAPI.check(email: email, verifyToken: verifyToken);

      if (data.data == null || data.data == false) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản đăng nhập. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data.data ?? false;
    } catch (e) {
      return false;
    }
  }
}
