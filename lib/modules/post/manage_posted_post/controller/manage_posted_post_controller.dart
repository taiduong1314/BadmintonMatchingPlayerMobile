import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../model/post/post_list_posted.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/call_api/post/call_api_post.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class ManagePostedPostController extends GetxController{
  RxList<PostedPostDataModel> listPosts = RxList.empty(growable: true);

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  void getPosts(){
    listPosts.value = Get.arguments['data'];
  }

  void onTapPost(PostedPostDataModel data) async {
    if (data.postId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy ID bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    await EasyLoading.show();
    var dataDetail = await CallAPIPost.getPostDetail(postID: data.postId!);
    await EasyLoading.dismiss();

    if (dataDetail.userId == null) {
      await CustomPopup.showOnlyText(Get.context,
          title: 'Thông báo',
          message: 'Không tìm thấy chi tiết bài đăng. Vui lòng quay lại sau',
          titleButton: 'Đã hiểu');
      return;
    }

    Get.toNamed(Routes.POSTDETAIL, arguments: {"data": dataDetail, "id": data.postId});
  }
}
