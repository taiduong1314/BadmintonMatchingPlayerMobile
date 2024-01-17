import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vbmsports/model/chat/chats_model.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/chat/call_api_chat.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

class ChatController extends GetxController {
  TextEditingController controllerSearch = TextEditingController();

  RxList<ChatDataModel> listRoom = RxList.empty(growable: true);

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    handleInit();
    super.onInit();
  }

  void handleInit() async {
    // await Jiffy.setLocale('vi');
    getAllRoom();
  }

  void getAllRoom() async {
    isLoading.value = true;
    await EasyLoading.show();
    listRoom.value = await CallAPIChat.listRoom();
    await EasyLoading.dismiss();
    isLoading.value = false;
  }

  void onTapChatDetail(
      {required int roomID,
      required String roomName,
      required String clientUrl}) {
    if (roomID == -1 || clientUrl == '') {
      CustomPopup.showOnlyText(Get.context,
          title: "Thông báo",
          message: "Không tìm thấy ID phòng. Thử lại sau",
          titleButton: 'Đã hiểu');
      return;
    }
    Get.toNamed(Routes.CHATDETAIL, arguments: {
      'id': roomID,
      'roomName': roomName,
      'clientUrl': clientUrl
    })?.then((value) {
      getAllRoom();
    });
  }
}
