import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/comment/comment_model.dart';
import 'package:vbmsports/model/user/user_info.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../utils/call_api/comment/call_api_comment.dart';

class UserInfoController extends GetxController {
  UserInfoDataModel data = Get.arguments['data'];
  int userID = Get.arguments['id'];

  TextEditingController txtComment = TextEditingController();

  RxList<CommentDataModel> listComments = RxList.empty(growable: true);

  RxBool isLoadingComments = true.obs;
  @override
  void onInit() {
    handleInit();
    super.onInit();
  }

  void handleInit() {
    unawaited(getComments());
  }

  Future<void> getComments() async {
    isLoadingComments.value = true;
    listComments.value = await CallAPIComment.getComments(userID: userID);
    listComments.value = listComments.reversed.toList();
    isLoadingComments.value = false;
  }

  Future<void> sendComment() async {
    if(txtComment.text.trim() == '') return;

    await EasyLoading.show();
    bool status = await CallAPIComment.sendComment(
        userIDReceive: userID, content: txtComment.text);

    if (!status) {
      await EasyLoading.dismiss();
      return;
    }

    getComments();

    await EasyLoading.dismiss();
    CustomPopup.showOnlyText(Get.context,
        title: "Thông báo",
        message: 'Bình luận của bạn đã được gửi thành công',
        onTap: () => txtComment.clear(),
        titleButton: 'Đã hiểu');
  }
}
