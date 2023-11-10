part of 'create_post_screen.dart';

extension BodyCustom on CreatePostScreen {
  Widget _body() {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _imageUpload(),
              spaceVertical(height: 16),
              _listImageUpload(),
              spaceVertical(height: 24),
              Divider(
                height: 1,
                indent: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
              spaceVertical(height: 24),
              _inputForm(
                  controllerText: controller.txtTitlePost,
                  title: 'Tên bài viết',
                  hintText: 'Nhập tiêu đề bài viết'),
              spaceVertical(height: 18),
              _inputForm(
                  controllerText: controller.txtAddress,
                  title: 'Địa chỉ',
                  hintText: 'Nhập địa chỉ'),
              spaceVertical(height: 18),
              _inputForm(
                  controllerText: controller.txtPrice,
                  title: 'Giá',
                  hintText: 'Nhập giá',
                  keyboardType: TextInputType.number),
              spaceVertical(height: 18),
              _btnTimePicker(),
              spaceVertical(height: 18),
              _btnDatePicker(),
              spaceVertical(height: 18),
            ],
          ),
        ),
        if (controller.dateRangeSelected.isNotEmpty) _listDayOfWeek(),
        spaceVertical(height: 18),
        if (controller.dateOfWeekSelected.isNotEmpty) _listInputSlotByDate(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              spaceVertical(height: 18),
              _inputFormDescription(
                  controllerText: controller.txtDescription,
                  title: 'Mô tả',
                  hintText: 'Nhập mô tả',
                  minLines: 4,
                  maxLines: 8,
                  maxLength: 300),
              spaceVertical(height: 18),
              CustomButton.commonButton(
                  title: 'Đăng bài', onTap: controller.onTapConfirm),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _imageUpload() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
          onTap: controller.doOpenGallery,
          child: const Image(image: AssetImage(AssetImageName.imageUpload)))
    ]);
  }

  Widget _listImageUpload() {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(direction: Axis.horizontal, spacing: 8.0, children: [
        ...List.generate(
            controller.imageUploadList.length,
            (index) => GestureDetector(
                onTap: () => controller.removeUploadedImage(index),
                child: UploadImagePreview(
                    widthImage: (Get.width - 48 - 24) / 4,
                    heightImage: (Get.width - 48 - 24) / 4,
                    filePath: controller.imageUploadList[index].path))),
      ]),
    );
  }

  Widget _btnTimePicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.textPlusJakarta(
            text: 'Giờ chơi', style: TextAppStyle.bodySmallBold()),
        spaceVertical(height: 15),
        GestureDetector(
          onTap: controller.onTapTimePicker,
          child: Container(
            width: Get.width,
            height: 48,
            decoration: BoxDecoration(
              color: AppColor.colorLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: AppColor.colorTextGrey20.withOpacity(0.2), width: 1.0),
            ),
            child: Row(
              children: [
                spaceHorizontal(width: 8),
                Expanded(
                    child: CustomText.textPlusJakarta(
                        text:
                            '${Utils.convertDateTime(date: controller.startTime.value.toString(), dateFormat: 'HH:mm')} - ${Utils.convertDateTime(date: controller.endTime.value.toString(), dateFormat: 'HH:mm')}',
                        style: TextAppStyle.bodySmall())),
                spaceHorizontal(width: 10),
                const Icon(Icons.keyboard_arrow_down_outlined),
                spaceHorizontal(width: 8),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _btnDatePicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.textPlusJakarta(
            text: 'Phạm vi ngày', style: TextAppStyle.bodySmallBold()),
        spaceVertical(height: 15),
        GestureDetector(
          onTap: controller.onTapDatePicker,
          child: Container(
            width: Get.width,
            height: 48,
            decoration: BoxDecoration(
              color: AppColor.colorLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: AppColor.colorTextGrey20.withOpacity(0.2), width: 1.0),
            ),
            child: Row(
              children: [
                spaceHorizontal(width: 8),
                Expanded(
                    child: CustomText.textPlusJakarta(
                        text: controller.dateRangeSelected.isEmpty
                            ? ""
                            : controller.dateRangeSelected.length > 1
                                ? '${Utils.convertDateTime(date: controller.dateRangeSelected.first.toString(), dateFormat: 'dd/MM/yyyy')} - ${Utils.convertDateTime(date: controller.dateRangeSelected.last.toString(), dateFormat: 'dd/MM/yyyy')}'
                                : Utils.convertDateTime(
                                    date: controller.dateRangeSelected.first
                                        .toString(),
                                    dateFormat: 'dd/MM/yyyy'),
                        style: TextAppStyle.bodySmall())),
                spaceHorizontal(width: 10),
                const Icon(Icons.keyboard_arrow_down_outlined),
                spaceHorizontal(width: 8),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _listDayOfWeek() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomText.textPlusJakarta(
                text: 'Chọn ngày', style: TextAppStyle.bodySmallBold()),
          ),
          spaceVertical(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                spaceHorizontal(width: 24),
                ...controller.dateRangeSelected
                    .map((date) => _itemDayOfWeek(date)),
                spaceHorizontal(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemDayOfWeek(DateTime date) {
    return GestureDetector(
      onTap: () => controller.onTapSelectDayOfWeek(date),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: controller.isSelectedDayOfWeek(date)
              ? AppColor.colorButton
              : AppColor.colorUnknown2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CustomText.textPlusJakarta(
            text: Utils.getDayOfWeek(date.weekday),
            style: TextAppStyle.bodyDefault().copyWith(
                color: controller.isSelectedDayOfWeek(date)
                    ? AppColor.colorLight
                    : AppColor.colorDark)),
      ),
    );
  }

  Widget _listInputSlotByDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: controller.dateOfWeekSelected
            .map((data) => _itemInputSlotByDate(data))
            .toList(),
      ),
    );
  }

  Widget _itemInputSlotByDate(DayOfWeekModel data) {
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
              title: 'Số lượng chỗ',
              hintText: 'Nhập số lượng chỗ',
              keyboardType: TextInputType.number),
        ],
      ),
    );
  }
}
