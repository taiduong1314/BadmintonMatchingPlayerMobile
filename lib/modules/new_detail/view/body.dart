part of 'new_detail_screen.dart';

extension HeaderPostDetail on NewDetailScreen {
  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          spaceVertical(height: 20),
          _image(),
          spaceVertical(height: 18),
          _title(),
          spaceVertical(height: 12),
          _rowView(),
          spaceVertical(height: 18),
          Divider(color: AppColor.colorDark.withOpacity(0.4)),
          spaceVertical(height: 18),
          _content(),
          spaceVertical(height: AppDataGlobal.safeBottom + 30),
        ],
      ),
    );
  }

  Widget _image() {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 200,
          decoration: BoxDecoration(
            color: AppColor.colorLight,
            border: Border.all(color: AppColor.colorButton, width: 1),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColor.colorGrey.withOpacity(0.18),
                spreadRadius: 4,
                blurRadius: 24,
                offset: const Offset(0, 0), // Điều chỉnh vị trí đổ bóng
              ),
            ],
          ),

          ///Load image network
          child: NetworkImageCustom.load(
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(12),
            imageUrl: controller.dataDetail.avatar ?? '',
          ),
        ),
        Positioned(
            left: (Get.width - 48) / 2 - 40,
            child: Container(
              padding: const EdgeInsets.fromLTRB(32, 1, 32, 2),
              decoration: BoxDecoration(
                color: AppColor.colorButton,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
              ),
              child: CustomText.textPlusJakarta(
                  text: "Tin tức",
                  style: TextAppStyle.bodySmall()
                      .copyWith(color: AppColor.colorLight)),
            ))
      ],
    );
  }

  Widget _title() {
    return SizedBox(
      width: Get.width,
      child: CustomText.textPlusJakarta(
          maxLine: 100,
          text: controller.dataDetail.name ?? '',
          style: TextAppStyle.h5().copyWith(color: AppColor.colorDark)),
    );
  }

  Widget _rowView() {
    return SizedBox(
      height: 16,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetSVGName.eyeOn,
            color: AppColor.colorDark.withOpacity(0.5),
            height: 16,
            width: 16,
          ),
          spaceHorizontal(width: 4),
          Flexible(
            child: CustomText.textPlusJakarta(
                textAlign: TextAlign.center,
                text: '10',
                style: TextAppStyle.bodySmall()
                    .copyWith(color: AppColor.colorDark.withOpacity(0.5))),
          ),
          spaceHorizontal(width: 12),
          Container(
            width: 1,
            height: 10,
            color: AppColor.colorDark.withOpacity(0.5),
          ),
          spaceHorizontal(width: 12),
          Flexible(
            child: CustomText.textPlusJakarta(
                textAlign: TextAlign.center,
                text: '18/11/2023 16:30',
                style: TextAppStyle.bodySmall()
                    .copyWith(color: AppColor.colorDark.withOpacity(0.5))),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return CustomText.textPlusJakarta(
        maxLine: 1000000,
        text: controller.dataDetail.content ?? '',
        style: TextAppStyle.size14W400()
            .copyWith(color: AppColor.colorGrey1, height: 1.5));
  }
}
