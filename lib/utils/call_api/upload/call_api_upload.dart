import 'dart:io';

import 'package:get/get.dart';

import '../../../api/post/upload/upload_image.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPIUpload {
  static Future<String> uploadImage(
      {required String base64}) async {
    var data = await UploadImageAPI.post(base64: base64);

    if (data.imgUrl == '' || data.imgUrl == null) {
      CustomPopup.showTextWithImage(Get.context,
          title:  'Ôi! Có lỗi xảy ra',
          message:
              'Đã xảy ra lỗi trong quá trình tải ảnh lên. Vui lòng thử lại',
          titleButton: 'know'.tr,
          svgUrl: AssetSVGName.error);
    }

    return data.imgUrl ?? '';
  }
}
