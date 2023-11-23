import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:vbmsports/model/chat/list_chat_detail.dart';
import 'package:vbmsports/utils/call_api/chat/call_api_chat.dart';

import '../../../utils/call_api/upload/call_api_upload.dart';
import '../../../utils/common/data.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import '../../../utils/widget/photo_viewer/photo_viewer.dart';

class ChatDetailController extends GetxController {
  final String serverUrl =
      'https://badminton-matching-24832d1c4b03.herokuapp.com/chatHub';

  late HubConnection connection;

  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  TextEditingController txtMessage = TextEditingController();

  RxList<ChatDetailModel> chatData = RxList.empty(growable: true);

  final ImagePicker _picker = ImagePicker();
  XFile? imageUploadList;

  String roomName = Get.arguments['roomName'];
  int roomId = Get.arguments['id'];

  int pageNum = 1;
  int pageSize = 100;

  RxBool isEmptyData = false.obs;
  RxBool isScrollLoading = false.obs;
  RxBool isLoading = true.obs;

  bool isFirstLoading = true;

  RxBool statusConnectChat = false.obs;

  @override
  Future<void> onInit() async {
    statusConnectChat.value = await initChat(roomID: roomId);
    await handleInit();

    super.onInit();
  }

  Future<void> handleInit() async {
    getDataChat();
  }

  Future<bool> initChat({required int roomID}) async {
    connection =
        HubConnectionBuilder().withUrl(serverUrl, HttpConnectionOptions(
      logging: (level, message) {
        if (kDebugMode) {
          print('******** SignalR - ${level.name}: $message');
        }
      },
    )).build();

    try {
      //ReceiveMessage
      connection.on('SendAsync', (arguments) async {
        if (kDebugMode) {
          print('***** SignalR --- ReceiveMessage: ${arguments?.toList()}');
        }
      });

      // connection.on('UsersInRoom', (users) {
      //   if (kDebugMode) {
      //     print('***** SignalR --- UsersInRoom: ${users?.toList()}');
      //   }
      // });

      await connection.start();
      // await connection.invoke('JoinRoom', args: [roomID, '']);

      return true;
    } catch (e) {
      await connection.stop();
      if (kDebugMode) {
        print('************* Try-Catch SignalRCustom: $e');
      }
      return false;
    }
  }

  void getDataChat() async {
    if (isFirstLoading) await EasyLoading.show();
    isFirstLoading = false;
    isLoading.value = true;

    var data = await CallAPIChat.listChatDetail(
        roomId: roomId, pageNum: pageNum, pageSize: pageSize);

    for (var element in data) {
      if (element.sendUserName == AppDataGlobal.user.value.userName) {
        int index = data.indexOf(element);
        data.elementAt(index).isFrom = true;
      }
    }

    isEmptyData.value = data.isEmpty;

    chatData.addAll(data);
    await Future.delayed(const Duration(milliseconds: 500));
    autoScroll();
    isLoading.value = false;
    await EasyLoading.dismiss();
  }

  void doSendChat() async {
    // if (!isConnectedChat.value || txtMessage.text == '') return;
    //
    unawaited(sendChat(message: txtMessage.text).then((value) => null));
    chatData.add(ChatDetailModel(
        isFrom: true, message: txtMessage.text, sendTime: '${DateTime.now()}'));
    txtMessage.clear();
    autoScroll();
  }

  Future<void> sendChat({required String message}) async {
    // await connection.invoke('Test', args: [message]);

    // await connection.invoke('SendMessage', args: [message]);
    await CallAPIChat.sendChat(roomId: roomId, message: message);
  }

  Future<void> sendImage({required String url}) async {
    // await connection.invoke('SendMessage', args: [url]);
    chatData.add(ChatDetailModel(
        isFrom: true,
        message: url,
        isImage: true,
        sendTime: '${DateTime.now()}'));
    await Future.delayed(const Duration(milliseconds: 500));
    autoScroll();
  }

  Future<void> doChooseImage() async {
    CommonModalBottomSheet.showUploadImage(
        context: Get.context!,
        onTapLeftButton: () async {
          await doOpenCamera();
        },
        onTapRightButton: () async {
          await doOpenGallery();
        });
  }

  Future<void> doOpenGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Get.back();
      imageUploadList = pickedFile;

      if (imageUploadList != null) {
        await uploadImage();
        return;
      }
    }

    return;
  }

  Future<void> doOpenCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Get.back();
      imageUploadList = pickedFile;

      if (imageUploadList != null) {
        await uploadImage();
        return;
      }
    }

    return;
  }

  Future<void> uploadImage() async {
    try {
      await EasyLoading.show();
      String imageUrl = await CallAPIUpload.uploadImage(
          base64: Utils.convertFileToBase64(imageUploadList!.path));

      await sendImage(url: imageUrl);
    } catch (e) {
      if (kDebugMode) {
        print('******* Error upload image chat: $e');
      }
    }finally{
      await EasyLoading.dismiss();
    }
  }

  void autoScroll() {
    if (scrollController.position.maxScrollExtent == 0) return;

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  Future<void> showImageFullScreen(
      {required List<String> imgUrl, required int index}) async {
    await showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) {
        return PhotoViewer(
          imgUrl: imgUrl,
          isShowIndex: false,
        );
      },
    );
  }
}
