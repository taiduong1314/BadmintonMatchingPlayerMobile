part of 'step1_choose_districts_screen.dart';

extension ProvincesCustom on Step1RegisterScreen {
  Widget _listProvinces() {
    return Column(
      children: [
        spaceVertical(height: 30),
        ...controller.listProvinces
            .map((element) => _province(element))
            .toList(),

        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }

  Widget _province(LocationDataModel data) {
    return GestureDetector(
      onTap: () => controller.onTapProvinces(data),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDataGlobal.border),
            border: Border.all(
                color: AppColor.colorTextGrey20.withOpacity(0.2), width: 1)),
        child: CustomText.textPlusJakarta(
            text: data.name ?? '', style: TextAppStyle.h6()),
      ),
    );
  }
}
