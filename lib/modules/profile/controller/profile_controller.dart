import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vbmsports/utils/call_api/user/call_api_user.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:vbmsports/utils/common/key_data_local.dart';
import 'package:vbmsports/utils/stored/shared_preferences/get.dart';
import 'package:vbmsports/utils/utils.dart';
import 'package:vbmsports/utils/widget/popup/custom_popup.dart';

import '../../../model/user/user.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/modal_bottom_sheet/common_bottom_sheet.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';

class ProfileController extends GetxController {
  TextEditingController txtNickName = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? imageUploadList;

  @override
  void onInit() {
    handleInit();
    super.onInit();
  }

  void handleInit() {
    txtNickName.text = AppDataGlobal.user.value.userName ?? '';
    txtFullName.text = AppDataGlobal.user.value.fullName ?? '';
    txtPhone.text = AppDataGlobal.user.value.phoneNumber ?? '';
    txtDescription.text = AppDataGlobal.user.value.sortProfile ?? '';
  }

  Future<void> doOpenGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Get.back();
      imageUploadList = pickedFile;

      if (imageUploadList != null) {
        await doConfirmAvatar(file: imageUploadList!);
      }
      return;
    }
  }

  Future<void> doOpenCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Get.back();
      imageUploadList = pickedFile;

      if (imageUploadList != null) {
        await doConfirmAvatar(file: imageUploadList!);
      }
      return;
    }
  }

  void doActionChangeAvatar({required int type}) {
    switch (type) {
      case 0:
        doOpenCamera();
        break;
      case 1:
        doOpenGallery();
        break;
    }
  }

  Future<void> doConfirmAvatar({required XFile file}) async {
    await CommonModalBottomSheet.show(
        customWidget: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        spaceVertical(height: 18),
        CustomText.textPlusJakarta(
            text: 'Xem trước hình ảnh',
            style: TextAppStyle.h4().copyWith(color: AppColor.colorDark)),
        spaceVertical(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.file(
            File(file.path),
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        spaceVertical(height: 16),
        Row(
          children: [
            spaceHorizontal(width: 18),
            Expanded(flex: 1, child: btnConfirmAvatar(type: 1)),
            spaceHorizontal(width: 12),
            Expanded(flex: 1, child: btnConfirmAvatar(type: 0)),
            spaceHorizontal(width: 18),
          ],
        ),
        spaceVertical(height: AppDataGlobal.safeBottom)
      ],
    ));
  }

  ///type: 0 -> Confirm Avatar
  ///type: 1 -> Choose different avatar
  Widget btnConfirmAvatar({required int type}) {
    return GestureDetector(
      onTap: () => doActionConfirmAvatar(type: type),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: AppColor.colorGrey300.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: CustomText.textPlusJakarta(
              text: type == 0 ? 'Xác nhận' : 'Chọn hình khác',
              style: TextAppStyle.bodyDefault()
                  .copyWith(color: AppColor.colorDark)),
        ),
      ),
    );
  }

  void doActionConfirmAvatar({required int type}) async {
    Get.back();
    switch (type) {
      case 0:
        try {
          await EasyLoading.show();
          String base64Image = Utils.convertFileToBase64(imageUploadList!.path);

        bool status =  await CallAPIUser.updateUserInfo(
              fullName: AppDataGlobal.user.value.fullName ?? '',
              userName: AppDataGlobal.user.value.userName ?? '',
              playingArea: AppDataGlobal.user.value.playingArea ?? '',
              sortProfile: AppDataGlobal.user.value.sortProfile ?? '',
              phoneNumber: AppDataGlobal.user.value.phoneNumber ?? '',
              imgBase64: base64Image);

        if(!status) return;

          String email =
              await GetDataFromLocal.getString(key: KeyDataLocal.usernameKey);
          String password =
              await GetDataFromLocal.getString(key: KeyDataLocal.passwordKey);

          UserDataModel data =
              await CallAPIUser.login(email: email, password: password);

          AppDataGlobal.user.value = data;
          AppDataGlobal.user.refresh();
        } finally {
          await EasyLoading.dismiss();
        }
        break;
      case 1:
        await doChangeAvatar();
        break;
    }
  }

  Future<void> doChangeAvatar() async {
    await CommonModalBottomSheet.showUploadImage(
        context: Get.context!,
        onTapLeftButton: () {
          doActionChangeAvatar(type: 0);
        },
        onTapRightButton: () {
          doActionChangeAvatar(type: 1);
        });
  }

  void onTapUpdateInfo() async {
    await EasyLoading.show();
    bool status = await CallAPIUser.updateUserInfo(
        fullName: txtFullName.text.trim(),
        userName: txtNickName.text.trim(),
        playingArea: AppDataGlobal.user.value.playingArea ?? '',
        sortProfile: txtDescription.text.trim(),
        phoneNumber: txtPhone.text.trim(),
        imgBase64: AppDataGlobal.user.value.avatar ?? '');

    if(!status){
      await EasyLoading.dismiss();
      return;
    }

    String email =
        await GetDataFromLocal.getString(key: KeyDataLocal.usernameKey);
    String password =
        await GetDataFromLocal.getString(key: KeyDataLocal.passwordKey);

    UserDataModel data =
        await CallAPIUser.login(email: email, password: password);

    AppDataGlobal.user.value = data;
    AppDataGlobal.user.refresh();
    handleInit();
    await EasyLoading.dismiss();
    Get.back();
    CustomPopup.showAnimationWithAction(Get.context,
        message: 'Cập nhật dữ liệu thành công',
        animationUrl: AssetAnimationCustom.paymentSuccessed,
        titleButton: 'Đã hiểu');
  }
}
