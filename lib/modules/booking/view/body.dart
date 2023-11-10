part of 'booking_screen.dart';

extension BodyCustom on BookingScreen {
  Widget _body() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVertical(height: 20),
            _infoYard(),
            spaceVertical(height: 32),
            _title('Thời gian và chỗ'),
            spaceVertical(height: 20),
            _listDayOfWeek(),
            spaceVertical(height: 18),
            if (controller.dateOfWeekSelected.isNotEmpty)
              _listInputSlotByDate(),
            spaceVertical(height: 20),
            if (controller.dateOfWeekSelected.isNotEmpty)
              _title('Phương thức thanh toán'),
            if (controller.dateOfWeekSelected.isNotEmpty)
              spaceVertical(height: 20),
            if (controller.dateOfWeekSelected.isNotEmpty) _paymentMethod(),
            spaceVertical(height: 20),
            if (controller.dateOfWeekSelected.isNotEmpty)
              _title('Tổng thanh toán'),
            if (controller.dateOfWeekSelected.isNotEmpty)
              spaceVertical(height: 20),
            if (controller.dateOfWeekSelected.isNotEmpty) _totalPayment(),
            if (controller.dateOfWeekSelected.isNotEmpty)
              spaceVertical(height: 20),
            if (controller.dateOfWeekSelected.isNotEmpty) _btnConfirmPayment(),
            spaceVertical(height: AppDataGlobal.safeBottom),
          ],
        ),
      ),
    );
  }

  Widget _infoYard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorGrey300)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: CustomText.textPlusJakarta(
                      maxLine: 2,
                      text: controller.data.title ?? '',
                      style: TextAppStyle.h6())),
              spaceHorizontal(width: 10),
              CustomText.textPlusJakarta(
                  text:
                      '${Utils.formatBalance('${controller.data.priceSlot}')}đ',
                  style: TextAppStyle.h6()),
            ],
          ),
          spaceVertical(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(AssetSVGName.location),
              spaceHorizontal(width: 4),
              Expanded(
                  child: CustomText.textPlusJakarta(
                      maxLine: 3,
                      text: controller.data.addressSlot ?? '',
                      style: TextAppStyle.bodySmall()
                          .copyWith(color: AppColor.colorGrey1))),
              spaceHorizontal(width: 35),
              CustomText.textPlusJakarta(
                  text: '/chỗ', style: TextAppStyle.bodySmall()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _title(content) {
    return CustomText.textPlusJakarta(text: content, style: TextAppStyle.h4());
  }

  Widget _listDayOfWeek() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.textPlusJakarta(
              text: 'Chọn ngày', style: TextAppStyle.bodySmallBold()),
          spaceVertical(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...controller.dateVsSlot.map((data) => _itemDayOfWeek(data)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemDayOfWeek(DayOfWeekModel data) {
    return Visibility(
      visible: (data.slot != -1 || data.slot != 0),
      child: GestureDetector(
        onTap: () => controller.onTapSelectDayOfWeek(data),
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          decoration: BoxDecoration(
              color: controller.isSelectedDayOfWeek(data)
                  ? AppColor.colorButton
                  : AppColor.colorUnknown2,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: AppColor.colorGrey300.withOpacity(0.5))),
          child: CustomText.textPlusJakarta(
              text: Utils.getDayOfWeek(
                  DateTime.tryParse(data.date!)?.weekday ?? -1),
              style: TextAppStyle.bodyDefault().copyWith(
                  color: controller.isSelectedDayOfWeek(data)
                      ? AppColor.colorLight
                      : AppColor.colorDark)),
        ),
      ),
    );
  }

  Widget _listInputSlotByDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: controller.dateOfWeekSelected
          .map((data) => _itemInputSlotByDate(data))
          .toList(),
    );
  }

  Widget _itemInputSlotByDate(DayOfWeekModel data) {
    var sort = controller.dateVsSlot.where((value) => data.date == value.date);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorGrey1.withOpacity(0.5))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.textPlusJakarta(
              text:
                  '${Utils.getDayOfWeek(DateTime.parse(data.date!).weekday)} - ${Utils.convertDateTime(date: data.date.toString(), dateFormat: 'dd/MM/yyyy')}',
              style: TextAppStyle.size14W600()),
          spaceVertical(height: 16),
          _inputForm(
              // controllerText: controllerText,
              onChanged: (value) async {
                int slot = int.tryParse(value) ?? -1;

                await controller.addSlotSelectedDayOfWeek(
                    data: data, slot: slot);
              },
              title:
                  'Số lượng chỗ còn lại ${sort.first.slot == -1 ? 0 : sort.first.slot}',
              hintText: 'Nhập số lượng chỗ',
              keyboardType: TextInputType.number),
        ],
      ),
    );
  }

  Widget _paymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _paymentMethodSectionItem(
            image: AssetImageName.vnPay, title: 'VNPAY', index: 0),
        _paymentMethodSectionItem(
            image: AssetImageName.vbmPay, title: 'VBM Pay', index: 1)
      ],
    );
  }

  Widget _paymentMethodSectionItem(
      {required String image, String? title, required int index}) {
    bool isSelected = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.onTapChoosePaymentMethod(index),
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColor.colorLight.withOpacity(0),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.colorGrey300)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(
              image: AssetImage(image),
              width: 30,
              height: 30,
            ),
            spaceHorizontal(width: 16),
            Expanded(
              child: CustomText.textPlusJakarta(
                  text: title ?? '', style: TextAppStyle.h6()),
            ),
            spaceHorizontal(width: 16),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 20,
              color: isSelected ? AppColor.colorButton : AppColor.colorGrey300,
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalPayment() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorGrey300)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _rowTextPayMent(
              title: 'Tiền sân / chỗ',
              content:
                  '${Utils.formatBalance('${controller.data.priceSlot}')}đ'),
          spaceVertical(height: 12),
          _rowTextPayMent(title: 'Số chỗ (slot)', content: '2 chỗ'),
          spaceVertical(height: 16),
          Container(
            width: Get.width / 1.5,
            color: AppColor.colorGrey300.withOpacity(0.6),
            height: 1,
          ),
          spaceVertical(height: 16),
          _rowTextPayMent(
              title: 'Tổng tiền', content: '${Utils.formatBalance('120000')}đ'),
        ],
      ),
    );
  }

  Widget _rowTextPayMent({required String title, required String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: CustomText.textPlusJakarta(
                maxLine: 1, text: title, style: TextAppStyle.bodyDefault())),
        spaceHorizontal(width: 10),
        CustomText.textPlusJakarta(text: content, style: TextAppStyle.h6()),
      ],
    );
  }

  Widget _btnConfirmPayment() {
    return CustomButton.commonButton(
        onTap: controller.onTapConfirmPayment,
        title: 'Thanh toán ngay');
  }
}
