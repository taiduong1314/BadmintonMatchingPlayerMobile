part of 'booking_detail_screen.dart';

extension BodyCustom on BookingDetailScreen {
  Widget _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: Get.width,
      height: Get.height,
      color: AppColor.colorLight,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _titleHeader(),
              spaceVertical(height: 26),
              _detailBooking(),
              spaceVertical(height: 20),
              _detailPayment(),
              spaceVertical(height: AppDataGlobal.safeBottom + 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleHeader() {
    return Container(
      width: Get.width,
      height: 40,
      alignment: Alignment.center,
      child: CustomText.textPlusJakarta(
          text: 'Chi tiết đặt sân', style: TextAppStyle.h4()),
    );
  }

  Widget _detailBooking() {
    return _commonContainer(
        column: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Chi tiết đơn hàng'),
        spaceVertical(height: 16),
        _content(
            title: 'Mã đơn hàng: ',
            content: '${controller.dataDetail.value.id ?? ''}'),
        spaceVertical(height: 12),
        _content(
            title: 'Tên sân: ',
            content: controller.dataDetail.value.post?.title ?? ''),
        spaceVertical(height: 12),
        _content(
            title: 'Địa chỉ: ',
            content: controller.dataDetail.value.post?.address ?? ''),
        spaceVertical(height: 12),
        _content(
            title: 'Số lượng chỗ: ',
            content: '${controller.dataDetail.value.slotCount ?? ''}'),
        spaceVertical(height: 12),
        _content(title: 'Thông tin chỗ: '),
        spaceVertical(height: 12),
        ...controller.dataDetail.value.slots!.map((element) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _content(title: '• Mã: ${element.id}'),
              spaceVertical(height: 12),
              _content(title: '• Thời gian: ${element.playDate}'),
              spaceVertical(height: 16),
              SizedBox(
                  width: Get.width,
                  child: Center(
                      child: Container(
                    width: Get.width / 2,
                    height: 1,
                    color: AppColor.colorGrey300,
                  ))),
              spaceVertical(height: 16),
            ],
          );
        }).toList(),
      ],
    ));
  }

  Widget _detailPayment() {
    return _commonContainer(
        column: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Thanh toán'),
        spaceVertical(height: 16),
        _content(title: 'Người thanh toán: '),
        spaceVertical(height: 12),
        _content(title: '• ${controller.dataDetail.value.buyerName ?? ''}'),
        spaceVertical(height: 12),
        _content(
            title: 'Đã thanh toán: ',
            content:
                '${Utils.formatBalance(controller.dataDetail.value.total ?? '---')}đ'),
        spaceVertical(height: 16),
        _content(title: 'Thời gian: '),
        spaceVertical(height: 12),
        _content(
            title:
                '• ${Utils.convertDateTimeFormat(date: controller.dataDetail.value.payTime ?? '', format: 'EEEE, dd MMMM yyyy HH:mm', dateFormat: 'HH:mm dd/MM/yyyy')}'),
      ],
    ));
  }

  Widget _commonContainer({required Widget column}) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.colorUnknown1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: column,
    );
  }

  Widget _title(text) {
    return CustomText.textPlusJakarta(
        text: text,
        style: TextAppStyle.h4().copyWith(color: AppColor.colorDark));
  }

  Widget _content({
    String? title,
    String? content,
  }) {
    return CustomText.textPlusJakarta(
        text: '${title ?? ''}${content ?? ''}',
        maxLine: 4,
        style: TextAppStyle.bodyDefault()
            .copyWith(color: AppColor.colorTextGrey600));
  }
}
