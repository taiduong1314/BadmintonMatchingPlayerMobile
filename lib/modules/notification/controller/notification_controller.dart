import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

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
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < 9; i++) {
      listNotification.add(NotificationDataModel(
          id: 0,
          avatar: 'https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg',
          name: 'Tus',
          content: 'đã gửi cho bạn một tin nhắn trong nhóm chat',
          time: '${DateTime.now().subtract(Duration(minutes: i))}'));
    }
    isLoading.value = false;
    await EasyLoading.dismiss();
  }
}
