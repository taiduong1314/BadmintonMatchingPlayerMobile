import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../model/post/post_list_joining.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/call_api/post/call_api_post.dart';
import '../../../../utils/widget/popup/custom_popup.dart';

class ManageJoiningPostController extends GetxController {
  RxList<JoinedPostDataModel> listPosts = RxList.empty(growable: true);

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  void getPosts(){
    listPosts.value = Get.arguments['data'];

    for (var element in listPosts) {
      int index = listPosts.indexOf(element);
      int total = 0;
      element.bookedInfos?.forEach((booked) {
        total += booked.bookedSlot ?? 0;
      });
      listPosts.elementAt(index).availableSlot = '$total';
    }
    listPosts.refresh();
  }

  void onTapPost(JoinedPostDataModel data) async {
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

    dataDetail.isPayment = true;
    dataDetail.transacionId = data.transacionId;
    Get.toNamed(Routes.POSTDETAIL, arguments: {"data": dataDetail, 'id': data.postId});
  }
}
