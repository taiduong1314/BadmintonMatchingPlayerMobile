import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../model/post/post_suggestion.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/call_api/post/call_api_post.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class AllPostController extends GetxController {
  RxList<PostSuggestionDataModel> listPosts = RxList.empty(growable: true);

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  void getPosts() {
    listPosts.value = Get.arguments['data'];
  }

  void onTapPost(PostSuggestionDataModel data) async {
    if (data.idPost == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy ID bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    await EasyLoading.show();
    var dataDetail = await CallAPIPost.getPostDetail(postID: data.idPost!);
    await EasyLoading.dismiss();

    if (dataDetail.userId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy chi tiết bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.POSTDETAIL,
        arguments: {"data": dataDetail, 'id': data.idPost});
  }
}
