import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../model/post/post_list_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/call_api/post/call_api_post.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class AllPostController extends GetxController {
  RxList<PostsDataModel> listPosts = RxList.empty(growable: true);

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  void getPosts() {
    listPosts.value = Get.arguments['data'];
  }

  void onTapPost(PostsDataModel data) async {
    if (data.id == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy ID bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    await EasyLoading.show();
    var dataDetail = await CallAPIPost.getPostDetail(postID: data.id!);
    await EasyLoading.dismiss();

    if (dataDetail.userId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy chi tiết bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.POSTDETAIL,
        arguments: {"data": dataDetail, 'id': data.id});
  }
}
