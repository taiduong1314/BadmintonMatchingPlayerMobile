import 'package:get/get.dart';
import 'package:vbmsports/api/get/chat/chat_detail.dart';
import 'package:vbmsports/api/post/chat/joining_chat.dart';
import 'package:vbmsports/api/post/chat/send_chat.dart';
import 'package:vbmsports/model/chat/list_chat_detail.dart';

import '../../../api/get/chat/list_chat.dart';
import '../../../model/chat/chats_model.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIChat {
  static Future<List<ChatDataModel>> listRoom() async {
    try {
      var data = await RoomsChatAPI.get();

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Không tìm thấy nhóm chat đang tham gia. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<ChatDetailModel>> listChatDetail(
      {required int roomId, required int pageNum, required pageSize}) async {
    try {
      var data = await ChatDetailAPI.get(
          roomId: roomId, pageNum: pageNum, pageSize: pageSize);

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Không tìm thấy dữ liệu chat. Vui long quay lại sau',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> sendChat(
      {required int roomId, required String message}) async {
    try {
      var data = await SendChatAPI.post(message: message, roomId: roomId);

      if (data.data == null || data.data == false) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Không tìm thấy dữ liệu chat. Vui long quay lại sau',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data.data ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> joinChat({required int roomId}) async {
    try {
      if(roomId == -1) return false;

      var data = await JoinChatAPI.post(roomId: roomId);

      if (data.data == null || data.data == false) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Hệ thống không thể tự động thêm bạn vào kênh chat. Vui lòng liên hệ admin',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return false;
      }

      return data.data ?? false;
    } catch (e) {
      return false;
    }
  }
}
