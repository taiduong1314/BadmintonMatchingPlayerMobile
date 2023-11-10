part of 'setting_screen.dart';

extension BodyCustom on AccountScreen {
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _item(
              assetSVGName: AssetSVGName.profile,
              title: "${AppDataGlobal.user.value.fullName}",
              subTitle: "Xem trang profile cá nhân",
              onTap: controller.onTapProfile),
          spaceVertical(height: 20),
          _item(
              assetSVGName: AssetSVGName.wallet,
              title: "Ví của tôi",
              subTitle: '${Utils.formatBalance('${AppDataGlobal.user.value.balance ?? 0}')}đ',
              onTap: controller.onTapWallet),
          spaceVertical(height: 20),
          _item(
              assetSVGName: AssetSVGName.post,
              title: "Quản lý bài đăng",
              subTitle: "Quản lý toàn bộ bài đăng",
              onTap: controller.onTapPost),
          spaceVertical(height: 20),
          _item(
              assetSVGName: AssetSVGName.managerPost,
              title: "Quản lý bài viết đã đăng ký",
              subTitle: "Quản lý toàn bộ bài đăng",
              onTap: controller.onTapManagerPost),
          spaceVertical(height: 20),
          _item(
              assetSVGName: AssetSVGName.setting,
              title: "Cài đặt",
              subTitle: "Cài đặt tài khoản của bạn",
              onTap: controller.onTapSetting),
          spaceVertical(height: 20),
          _btnLogout(),
          spaceVertical(height: 20)
        ],
      ),
    );
  }

  Widget _item({
    required String assetSVGName,
    required String title,
    required String subTitle,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.colorUnknown, width: 1),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.colorUnknown1,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(assetSVGName, width: 24, height: 24),
            ),
            spaceHorizontal(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.textPlusJakarta(
                    text: title, style: TextAppStyle.h6()),
                spaceVertical(height: 8),
                CustomText.textPlusJakarta(
                    text: subTitle,
                    style: TextAppStyle.bodySmall()
                        .copyWith(color: AppColor.colorTextDark)),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _btnLogout() {
    return GestureDetector(
      onTap: controller.onTapLogout,
      child: Container(
        width: Get.width,
        height: 58,
        decoration: BoxDecoration(
            color: AppColor.colorUnknown1,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: CustomText.textPlusJakarta(
              text: 'Đăng xuất', style: TextAppStyle.h6()),
        ),
      ),
    );
  }
}
