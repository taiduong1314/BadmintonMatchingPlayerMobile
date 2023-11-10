import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:vbmsports/model/player_suggestion/player_suggestion_model.dart';
import 'package:vbmsports/utils/widget/loading/load_network_image.dart';

import '../../../../utils/common/button.dart';
import '../../../../utils/common/color.dart';
import '../../../../utils/common/data.dart';
import '../../../../utils/common/text_style.dart';
import '../../../../utils/widget/space/space.dart';
import '../../../../utils/widget/text/montserrat.dart';
import '../controller/step4_recomment_players_controller.dart';

class Step4RegisterScreen extends GetView<Step4RegisterController> {
  const Step4RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColor.colorLight,
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(height: 40),
              _indexStep(),
              spaceVertical(height: 4),
              _heading('Gợi ý người chơi ${controller.demoString.value}'),
              spaceVertical(height: 30),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: controller.playersSuggestion
                      .map((element) => _playerSuggestion(element))
                      .toList(),
                ),
              )),
              spaceVertical(height: 10),
              Row(
                children: [
                  Expanded(child: _btnBack()),
                  spaceHorizontal(width: 11),
                  Expanded(child: _btnNext()),
                ],
              ),
              spaceVertical(height: AppDataGlobal.safeBottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heading(title) {
    return Container(
        alignment: Alignment.centerLeft,
        width: Get.width,
        child:
            CustomText.textPlusJakarta(text: title, style: TextAppStyle.h3()));
  }

  Widget _indexStep() {
    return CustomText.textPlusJakarta(
        text: '4/4',
        style: TextAppStyle.medium().copyWith(color: AppColor.colorBlue100));
  }

  Widget _playerSuggestion(PlayerSuggestionDataModel data) {
    return GestureDetector(
      onTap: () => controller.onTapPlayerSuggestion(data),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: AppColor.colorLight,
            borderRadius: BorderRadius.circular(AppDataGlobal.border),
            border: Border.all(color: AppColor.colorLight100)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  NetworkImageCustom.load(
                      imageUrl: data.imageUrl ?? '',
                      width: 80,
                      height: 80,
                      border:
                          Border.all(color: AppColor.colorLight100, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                      fit: BoxFit.cover,
                      widthErrorImage: 40,
                      heightErrorImage: 40),
                  spaceHorizontal(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText.textPlusJakarta(
                            text: data.name ?? "", style: TextAppStyle.h6()),
                        spaceVertical(height: 4),
                        Expanded(
                          child: CustomText.textPlusJakarta(
                              text: data.shortProfile ?? "",
                              maxLine: 2,
                              style: TextAppStyle.bodySmall()),
                        ),
                        spaceVertical(height: 6),
                        SizedBox(
                            width: Get.width,
                            child: _ratingBar(data.rating ?? 0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            spaceVertical(height: 16),
            _btnFollowPlayer(),
          ],
        ),
      ),
    );
  }

  Widget _btnFollowPlayer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
          color: AppColor.colorGrey, borderRadius: BorderRadius.circular(999)),
      child: CustomText.textPlusJakarta(
          text: 'Đăng ký',
          style:
              TextAppStyle.size14W600().copyWith(color: AppColor.colorBlue100)),
    );
  }

  Widget _ratingBar(double rating) {
    return RatingBar.builder(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: AppColor.colorLogo,
      ),
      itemSize: 16,
      onRatingUpdate: (double value) {},
    );
  }

  Widget _btnNext() {
    return CustomButton.commonButton(
        onTap: controller.onTapNext, title: 'Tiếp tục', height: 58);
  }

  Widget _btnBack() {
    return CustomButton.commonButton(
        title: 'Quay lại',
        onTap: controller.onTapBack,
        backgroundColor: AppColor.colorLight,
        borderColor: AppColor.colorBoder,
        titleColor: AppColor.colorDark);
  }
}
