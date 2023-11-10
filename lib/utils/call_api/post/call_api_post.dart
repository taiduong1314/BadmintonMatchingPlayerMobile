import 'package:get/get.dart';
import 'package:vbmsports/api/get/post/post_detail.dart';
import 'package:vbmsports/api/get/post/post_suggestion.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import 'package:vbmsports/model/post/post_suggestion.dart';

import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIPost {
  static Future<List<PostSuggestionDataModel>> getPostsSuggestion() async {
    try {
      var data = await PostSuggestionAPI.get();

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá lấy thông tin bài đăng. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

  static Future<PostDetailDataModel> getPostDetail({
    required int postID
}) async {
    try {
      var data = await PostDetailAPI.get(postID: postID);

      if (data.data?.userId == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá trình kiểm tra tài khoản đăng nhập. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return PostDetailDataModel();
      }

      return data.data ?? PostDetailDataModel();
    } catch (e) {
      return PostDetailDataModel();
    }
  }
}
