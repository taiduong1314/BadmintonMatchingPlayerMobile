
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';

import '../../../../model/post/post_detail_model.dart';

class PostDetailController extends GetxController{

  PostDetailDataModel dataDetail = Get.arguments['data'];
  int id = Get.arguments['id'];
  RxInt indexBanner = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTapHostProfile() async{
    if(dataDetail.userId ==  null) return;

    await EasyLoading.show();
    var data = await CallAPIUser.getUserInfo(userID: dataDetail.userId!);
    await EasyLoading.dismiss();
    Get.toNamed(Routes.USERINFO, arguments: {"id": dataDetail.userId!, "data": data});
  }

  void onTapBooking(){
    Get.toNamed(Routes.BOOKING, arguments: {"data": dataDetail, 'id': id});
  }
}