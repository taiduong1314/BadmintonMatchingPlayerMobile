import 'package:get/get.dart';
import 'package:vbmsports/api/get/otp/verify_otp.dart';
import 'package:vbmsports/model/otp/verify_otp.dart';

import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIOTP {
  static Future<VerifyOtpModel> send({
    required String email,
  }) async {
    try {
      var data = await VerifyOTPAPI.get(email: email);

      if (data.otp == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.errorCode ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản đăng nhập. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return VerifyOtpModel();
      }

      return data;
    } catch (e) {
      return VerifyOtpModel();
    }
  }
}
