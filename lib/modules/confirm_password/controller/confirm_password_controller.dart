import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/get.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

class ConfirmPasswordController extends GetxController {
  String routes = Get.arguments['routes'];
  Map<String, dynamic> arguments = Get.arguments['arguments'];

  TextEditingController txtPassword = TextEditingController();

  RxBool isHidePassword = true.obs;

  void doHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  void onTapConfirm() async {
    String password =
        await GetDataFromLocal.getString(key: KeyDataLocal.passwordKey);

    if (password != txtPassword.text) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Ops',
          message: 'Mật khẩu không chính xác. Vui lòng kiểm tra lại',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.offAndToNamed(routes, arguments: arguments);
  }
}
