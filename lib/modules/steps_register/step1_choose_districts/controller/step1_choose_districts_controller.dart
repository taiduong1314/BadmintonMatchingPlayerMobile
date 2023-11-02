import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/call_api/location/call_api_location.dart';

import '../../../../model/location/location_model.dart';

class Step1RegisterController extends GetxController {
  RxBool isChoosingProvinces = true.obs;

  RxList<LocationModel> listProvinces = RxList.empty(growable: true);
  RxList<LocationModel> listDistricts = RxList.empty(growable: true);

  Rx<LocationModel> districtSelected = LocationModel().obs;

  @override
  void onInit() {
    getProvinces();
    super.onInit();
  }

  void getProvinces() async {
    try {
      await EasyLoading.show();
      listProvinces.value = await CallAPILocation.getProvince();
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> getDistricts(String id) async {
    try {
      await EasyLoading.show();
      listDistricts.value = await CallAPILocation.getDistrict(keyProvince: id);
    } finally {
      await EasyLoading.dismiss();
    }
  }

  void onTapProvinces(LocationModel data) async {
    isChoosingProvinces.value = false;
    await getDistricts(data.id.toString());
  }

  void onTapDistricts(LocationModel data) {
    districtSelected.value = data;
  }

  void onTapBack() {
    listDistricts.clear();
    isChoosingProvinces.value = true;
  }

  void onTapNext() {
    Get.toNamed(Routes.STEP2REGISTER);
  }
}
