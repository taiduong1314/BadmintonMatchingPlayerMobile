
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/post/comment/comment.dart';

import '../../../api/get/comment/comment.dart';
import '../../../model/comment/comment_model.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIComment{
  static Future<List<CommentDataModel>> getComments(
      {required int userID}) async {
    try {
      var data = await CommentAPI.get(userID: userID);

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình gợi ý người chơi',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }
      return data.data ?? [];
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return [];
    }
  }

  static Future<bool> sendComment(
      {required int userIDReceive, String? content}) async {
    try {
      var data = await SendCommentAPI.post(userIDReceive: userIDReceive, content: content);

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình gợi ý người chơi',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }
      return data.data ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('*********** Error CallAPIUser getPlayerSuggestion: $e');
      }

      return true;
    }
  }
}