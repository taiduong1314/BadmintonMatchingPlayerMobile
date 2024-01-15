import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vbmsports/utils/call_api/notification/call_api_notification.dart';

import '../../../model/notification/notification_model.dart';

class NotificationController extends GetxController {
  RxList<NotificationDataModel> listNotification = RxList.empty(growable: true);

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    setLocal();
    handleInit();
    super.onInit();
  }

  void setLocal() async{
    await Jiffy.setLocale('vi');
  }

  void handleInit() async {
    await EasyLoading.show();
    // await Future.delayed(const Duration(seconds: 1));
    listNotification.value = await CallAPINotifications.getNotification();
    await EasyLoading.dismiss();
    isLoading.value = false;
  }
}
