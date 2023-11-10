import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/post/post_suggestion.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/post/call_api_post.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

class HomeController extends GetxController {
  RxList<PostSuggestionDataModel> listPostSuggestion =
      RxList.empty(growable: true);

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    handleInit();
    super.onInit();
  }

  void handleInit() async {
    await EasyLoading.show();
    listPostSuggestion.value = await CallAPIPost.getPostsSuggestion();

    isLoading.value = false;
    await EasyLoading.dismiss();
  }

  void onTapChooseLocation() {}

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

    Get.toNamed(Routes.POSTDETAIL, arguments: {"data": dataDetail});
  }

  void onTapYardJoining() async {
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }

  void onTapYardLike() async {
    await CustomPopup.showAnimationWithAction(Get.context,
        message: "Tính năng đang được phát triển vui lòng quay lại sau",
        titleButton: "Đã hiểu",
        maxLineMessage: 3,
        repeatAnimation: true,
        animationUrl: AssetAnimationCustom.crying);
  }

  void onTapViewAllYards() {}
}
