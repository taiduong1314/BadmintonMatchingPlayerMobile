part of 'post_detail_screen.dart';

extension BodyCustom on PostDetailScreen {
  Widget _body() {
    return Container(
      width: Get.width,
      height: Get.height / 1.4,
      // constraints: BoxConstraints(maxHeight: Get.height / 1.4),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      child: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              spaceVertical(height: 20),
              _header(),
              spaceVertical(height: 20),
              _hostInfo(),
              spaceVertical(height: 20),
              _moreInfoYards(),
              spaceVertical(height: 20),
              _description(),
              spaceVertical(height: AppDataGlobal.safeBottom + 100)
            ],
          )),
          if (controller.dataDetail.userId != AppDataGlobal.user.value.id)
            Positioned(
                width: Get.width - 60,
                bottom: AppDataGlobal.safeBottom,
                child: Center(child: _btnBooking())),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: CustomText.textPlusJakarta(
                    maxLine: 2,
                    text: controller.dataDetail.title ?? '',
                    style: TextAppStyle.h6())),
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
                    text: controller.dataDetail.addressSlot ?? '',
                    style: TextAppStyle.bodySmall()
                        .copyWith(color: AppColor.colorGrey1))),
          ],
        ),
      ],
    );
  }

  Widget _hostInfo() {
    return GestureDetector(
      onTap: controller.onTapHostProfile,
      child: Container(
        color: AppColor.colorLight,
        child: Row(
          children: [
            NetworkImageCustom.load(
                border: Border.all(color: AppColor.colorGrey1, width: 1),
                width: 40,
                height: 40,
                imageUrl: controller.dataDetail.imgUrlUser ?? '',
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(100)),
            spaceHorizontal(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.textPlusJakarta(
                      text: controller.dataDetail.fullName ?? '',
                      style: TextAppStyle.h6()),
                  spaceVertical(height: 4),
                  _ratingBar(controller.dataDetail.totalRate?.toDouble() ?? 5),
                ],
              ),
            ),
            SvgPicture.asset(
              AssetSVGName.arrowRight,
              color: AppColor.colorDark,
            ),
          ],
        ),
      ),
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

  Widget _moreInfoYards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHorizontal(width: Get.width),
        spaceVertical(height: 20),
        _title('Thông tin sân: '),
        spaceVertical(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: Get.width - (28 * 2 + ((Get.width / 2) - 28 - 5) * 2),
          runSpacing: Get.width - (28 * 2 + ((Get.width / 2) - 28 - 5) * 2),
          children: controller.dataDetail.slotInfos
                  ?.map(
                    (slot) => _itemInfoYard(slot),
                  )
                  .toList() ??
              [],
        ),
      ],
    );
  }

  Widget _itemInfoYard(SlotInfo slot) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: (Get.width / 2) - 28 - 5,
      constraints: const BoxConstraints(minWidth: 140, maxWidth: 170),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            width: 0.5, color: AppColor.colorGrey300.withOpacity(0.8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _title(
              Utils.getDayOfWeek(DateTime.parse(slot.startTime ?? '').weekday)),
          spaceVertical(height: 4),
          _title(Utils.convertDateTime(
              date: '${slot.startTime ?? ' '}', dateFormat: 'dd/MM/yyyy')),
          spaceVertical(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetSVGName.clockCircle),
              spaceHorizontal(width: 6),
              Flexible(
                  child: _content(
                      '${Utils.convertDateTime(date: slot.startTime ?? '', dateFormat: 'HH:mm')} - ${Utils.convertDateTime(date: slot.endTime ?? '', dateFormat: 'HH:mm')}'))
            ],
          ),
          spaceVertical(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetSVGName.slot),
              spaceHorizontal(width: 6),
              Flexible(
                  child: _content(
                      '${Utils.formatBalance(slot.price.toString())}đ'))
            ],
          ),
        ],
      ),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHorizontal(width: Get.width),
        _title('Mô tả: '),
        spaceVertical(height: 8),
        ReadMoreText(
          controller.dataDetail.contentPost ?? '',
          style: TextAppStyle.bodyDefault()
              .copyWith(color: AppColor.colorGrey1, height: 1.3),
          moreStyle:
              TextAppStyle.bodyDefault().copyWith(color: AppColor.colorBlue100),
          trimCollapsedText: ' Xem thêm',
          trimExpandedText: ' Ẩn bớt',
        )
      ],
    );
  }

  Widget _title(title) {
    return CustomText.textPlusJakarta(
        text: title,
        style: TextAppStyle.h6().copyWith(color: AppColor.colorTextGrey600));
  }

  Widget _content(content) {
    return SizedBox(
        width: Get.width,
        child: CustomText.textPlusJakarta(
            text: content,
            style: TextAppStyle.bodyDefault()
                .copyWith(color: AppColor.colorGrey1)));
  }

  Widget _btnBooking() {
    return controller.dataDetail.isPayment == true
        ? controller.dataDetail.canReport == true ? CustomButton.commonButton(
        title: "Đánh giá ngay", onTap: controller.onTapReport) : SizedBox(
      width: Get.width - 28*2,
          child: Row(
      mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomButton.commonButton(
                      title: "Đặt sân ngay", onTap: controller.onTapBooking),
                ),
                spaceHorizontal(width: 20),
                Expanded(
                  child: CustomButton.commonButton(
                      title: "Xem hoá đơn", onTap: controller.onTapBill),
                )
              ],
            ),
        )
        : CustomButton.commonButton(
            title: "Đặt sân ngay", onTap: controller.onTapBooking);
  }
}
