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
  final String serverUrl = Get.arguments['clientUrl'];
  String roomName = Get.arguments['roomName'];
  int roomId = Get.arguments['id'];

  late HubConnection connection;

  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  TextEditingController txtMessage = TextEditingController();

  RxList<ChatDetailModel> chatData = RxList.empty(growable: true);

  final ImagePicker _picker = ImagePicker();
  XFile? imageUploadList;

  int pageNum = 1;
  int pageSize = 100;

  RxBool isEmptyData = false.obs;
  RxBool isScrollLoading = false.obs;
  RxBool isLoading = true.obs;

  bool isFirstLoading = true;

  RxBool statusConnectChat = false.obs;

  @override
  Future<void> onInit() async {
    if (isFirstLoading) await EasyLoading.show();
    statusConnectChat.value = await initChat(roomID: roomId);
    await handleInit();
    await EasyLoading.dismiss();
    super.onInit();
  }

  @override
  void onClose() {
    stopChat();
    super.onClose();
  }

  Future<void> handleInit() async {
    await getDataChat();
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
      connection.on('ReceiveMessage', (arguments) async {
        if (kDebugMode) {
          print('***** SignalR --- ReceiveMessage: ${arguments?.toList()}');
        }

        if (arguments?.first == 'Bot chat') return;

        String idUser = arguments?.first
                .toString()
                .substring(0, arguments?.first.toString().indexOf('-')) ??
            '';

        if (idUser == AppDataGlobal.user.value.id.toString()) return;

        String userName = arguments?.first
                .toString()
                .substring(arguments.first.toString().indexOf('-') + 1) ??
            '';

        bool isUrl = Utils.isURL(arguments?.last ?? '');

        bool isImage = false;

        if (isUrl) {
          isImage = await Utils.isImage(arguments?.last ?? '');
        }

        chatData.add(ChatDetailModel(
            isFrom: false,
            message: arguments?.last ?? '',
            sendTime: '${DateTime.now()}',
            sendUserName: userName,
            isImage: isImage));

        await Future.delayed(const Duration(milliseconds: 1000));
        autoScroll();
      });

      // connection.on('UsersInRoom', (users) {
      //   if (kDebugMode) {
      //     print('***** SignalR --- UsersInRoom: ${users?.toList()}');
      //   }
      // });

      await connection.start();
      await connection
          .invoke('JoinRoom', args: [roomID, AppDataGlobal.user.value.id]);

      return true;
    } catch (e) {
      await connection.stop();
      if (kDebugMode) {
        print('************* Try-Catch SignalRCustom: $e');
      }
      return false;
    }
  }

  Future<void> getDataChat() async {
    isFirstLoading = false;
    isLoading.value = true;

    var data = await CallAPIChat.listChatDetail(
        roomId: roomId, pageNum: pageNum, pageSize: pageSize);

    for (var element in data) {
      int index = data.indexOf(element);
      data.elementAt(index).isFrom =
          (element.sendUserName == AppDataGlobal.user.value.userName);
      bool isImage = await Utils.isImage(element.message ?? '');
      data.elementAt(index).isImage = isImage;
    }

    isEmptyData.value = data.isEmpty;

    chatData.addAll(data);
    await Future.delayed(const Duration(milliseconds: 1000));
    autoScroll();
    isLoading.value = false;
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
    try {
      await connection
          .invoke('SendMessage', args: [message, AppDataGlobal.user.value.id]);
    } catch (e) {}

    // await CallAPIChat.sendChat(roomId: roomId, message: message);
  }

  Future<void> sendImage({required String url}) async {
    try {
      await connection
          .invoke('SendMessage', args: [url, AppDataGlobal.user.value.id]);
    } catch (e) {}

    chatData.add(ChatDetailModel(
        isFrom: true,
        message: url,
        isImage: true,
        sendTime: '${DateTime.now()}'));
    // unawaited(CallAPIChat.sendChat(roomId: roomId, message: url));
    await Future.delayed(const Duration(milliseconds: 1000));
    autoScroll();
  }

  Future<void> stopChat() async {
    statusConnectChat.value = false;
    await connection.stop();
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
    } finally {
      await EasyLoading.dismiss();
    }
  }

  void autoScroll() {
    if (scrollController.position.maxScrollExtent == 0) return;

    scrollController.animateTo(scrollController.position.maxScrollExtent + 80,
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
