import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/get/location/province.dart';

import '../../../api/get/location/districts.dart';
import '../../../model/location/location_model.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';

class CallAPILocation {
  static Future<List<LocationDataModel>> getProvince() async {
    try {
      var data = await ProvincesAPI.get();

      if (data.data == [] || data.data == null) {
        await CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message: 'Đã xảy ra lỗi trong quá trình cập nhật dữ liệu thành phố',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      if (kDebugMode) {
        print('*************** Error CallAPILocation getProvince: $e');
      }
      return [];
    }
  }

  static Future<List<LocationDataModel>> getDistrict(
      {String keyProvince = '1'}) async {
    try {
      // keyProvince = 1: TP HCM
      var data = await DistrictAPI.get(keyProvince: keyProvince);

      if (data.data == [] || data.data == null) {
        await CustomPopup.showTextWithImage(Get.context,
            title: 'Ôi! Có lỗi xảy ra',
            message:
                'Đã xảy ra lỗi trong quá trình cập nhật dữ liệu địa phương',
            titleButton: 'Đã hiểu',
            svgUrl: AssetSVGName.error);
        return [];
      }

      return data.data ?? [];
    } catch (e) {
      if (kDebugMode) {
        print('*************** Error CallAPILocation getDistrict: $e');
      }
      return [];
    }
  }
}
