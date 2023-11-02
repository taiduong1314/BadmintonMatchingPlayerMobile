
import 'package:get/get.dart';
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
            message:
            data.errorEmail ?? 'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản. Vui lòng thử lại',
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
}
