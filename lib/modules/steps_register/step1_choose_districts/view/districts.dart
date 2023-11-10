part of 'step1_choose_districts_screen.dart';

extension DistrictsCustom on Step1RegisterScreen {
  Widget _listDistricts() {
    return Column(
      children: [
        spaceVertical(height: 30),
        ...controller.listDistricts
            .map((element) => _district(element))
            .toList(),
      ],
    );
  }

  Widget _district(LocationDataModel data) {
    return GestureDetector(
      onTap: () => controller.onTapDistricts(data),
      child: Container(
        width: Get.width,
        color: AppColor.colorLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            SvgPicture.asset(controller.districtSelected.value.id == data.id
                ? AssetSVGName.radioActive
                : AssetSVGName.radioDisabled),
            spaceHorizontal(width: 15),
            CustomText.textPlusJakarta(
                text: data.name ?? '', style: TextAppStyle.h6()),
          ],
        ),
      ),
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
