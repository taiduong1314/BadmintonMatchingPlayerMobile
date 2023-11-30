import 'package:get/get.dart';
import 'package:vbmsports/api/get/post/post_detail.dart';
import 'package:vbmsports/api/get/post/post_list.dart';
import 'package:vbmsports/api/get/post/post_play_ground.dart';
import 'package:vbmsports/api/get/post/post_suggestion.dart';
import 'package:vbmsports/api/get/post/posts_list_joining.dart';
import 'package:vbmsports/api/post/posts/create_post.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import 'package:vbmsports/model/post/post_list_joining.dart';
import 'package:vbmsports/model/post/post_suggestion.dart';

import '../../../api/get/post/post_list_posted.dart';
import '../../../model/post/post_list_posted.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIPost {
  static Future<List<PostSuggestionDataModel>> getListPosts() async {
    try {
      var data = await PostsListAPI.get();

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá lấy danh sách bài đăng. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<PostSuggestionDataModel>> getListPostsByPlayGround({required int wardID}) async {
    try {
      var data = await PlayGroundAPI.get(locationID: wardID);

      if (data.data == null || data.data?.length == 0) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: (data.message?.toLowerCase() == 'success' ? 'Không tìm thấy sân nào phù hợp. Vui lòng thử lại' : data.message)  ??
                'Đã xảy ra lỗi trong quá lấy danh sách bài đăng. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }


      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

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

  static Future<List<JoinedPostDataModel>> getJoiningPosts() async {
    try {
      var data = await JoiningPostsAPI.get();

      if (data.data == null || data.data?.length == 0) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.data?.length == 0
                ? 'Bạn chưa đăng ký sân nào. Vui lòng đăng ký để xem chi tiết'
                : data.message ??
                    'Đã xảy ra lỗi trong quá lấy thông tin bài viết đang tham gia. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<PostedPostDataModel>> getPostedPosts() async {
    try {
      var data = await PostedPostsAPI.get();

      if (data.data == null) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: data.message ??
                'Đã xảy ra lỗi trong quá lấy thông tin bài viết đang tham gia. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      return [];
    }
  }

  static Future<PostDetailDataModel> getPostDetail(
      {required int postID}) async {
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

  static Future<bool> createPost({
    required String levelSlot,
    required String categorySlot,
    required String title,
    required String address,
    required List<SlotInfo> slots,
    required String description,
    required List<String> imgUrls,
    required String highlightUrl,
  }) async {
    try {
      bool data = await CreatePostAPI.post(
          levelSlot: levelSlot,
          categorySlot: categorySlot,
          title: title,
          address: address,
          slots: slots,
          description: description,
          imgUrls: imgUrls,
          highlightUrl: highlightUrl);

      if (data == false) {
        CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message:
                'Đã xảy ra lỗi trong quá trình tạo bài viết. Vui lòng thử lại',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
      }

      return data;
    } catch (e) {
      return false;
    }
  }
}
