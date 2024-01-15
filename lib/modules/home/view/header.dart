part of 'home_screen.dart';

extension HeaderCustom on HomeScreen {
  Widget _header() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceHorizontal(width: Get.width),
        spaceVertical(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.textPlusJakarta(
                      text: 'Xin chào,', style: TextAppStyle.bodyDefault()),
                  spaceVertical(height: 4),
                  CustomText.textPlusJakarta(
                      text: '${AppDataGlobal.user.value.fullName} 👋',
                      style: TextAppStyle.h3()),
                ],
              ),
            ),
            GestureDetector(
                onTap: controller.onTapNotification,
                child: SvgPicture.asset(
                  AssetSVGName.notificationBottom,
                  width: 25,
                  height: 25,
                )),
            spaceHorizontal(width: 12),
          ],
        ),
        spaceVertical(height: 20),
        _chooseLocationPlay(),
        spaceVertical(height: 12),
        _rowOption(),
      ],
    );
  }

  Widget _chooseLocationPlay() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.colorTertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          CustomText.textPlusJakarta(
              text: 'Bạn Muốn Tìm Sân Chơi Cầu Lông?',
              style: TextAppStyle.bodySmall()),
          spaceVertical(height: 16),
          _btnQuickFindLocation(),
        ],
      ),
    );
  }

  Widget _btnQuickFindLocation() {
    return GestureDetector(
      onTap: controller.onTapQuickFindLocation,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
            child: CustomText.textPlusJakarta(
                text: 'Tìm sân nhanh', style: TextAppStyle.size14W600())),
      ),
    );
  }

  Widget _rowOption() {
    return SizedBox(
      width: Get.width,
      child: Row(
        children: [
          Expanded(
              child: _btnOption(
                  svgName: AssetSVGName.link,
                  colorBackgroundIcon: const Color(0xFF4FABFF).withOpacity(0.2),
                  title: 'Sân đang tham gia',
                  onTap: controller.onTapYardJoining)),
          spaceHorizontal(width: 14),
          Expanded(
              child: _btnOption(
                  onTap: controller.onTapManagePosts,
                  svgName: AssetSVGName.post,
                  colorBackgroundIcon: const Color(0xFF4FABFF).withOpacity(0.2),
                  title: 'Quản lý bài đăng')),
        ],
      ),
    );
  }

  Widget _btnOption({
    required String svgName,
    Color? colorBackgroundIcon,
    required String title,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.colorUnknown2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: colorBackgroundIcon,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(svgName)),
            spaceHorizontal(width: 12),
            Flexible(
              child: CustomText.textPlusJakarta(
                  text: title, maxLine: 2, style: TextAppStyle.size14W600()),
            ),
          ],
        ),
      ),
    );
  }
}
