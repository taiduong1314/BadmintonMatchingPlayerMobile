part of 'wallet_screen.dart';

extension HistoryCustom on WalletScreen {
  Widget _history() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        spaceVertical(height: 16),
        Expanded(child: SingleChildScrollView(child: _listHistory())),
      ],
    );
  }

  Widget _title() {
    return SizedBox(
        width: Get.width,
        child: CustomText.textPlusJakarta(
            text: 'Lịch sử giao dịch', style: TextAppStyle.h6()));
  }

  Widget _listHistory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(12, (index) => _itemHistory()).toList(),
        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }

  Widget _itemHistory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Get.width,
          height: 1,
          color: AppColor.colorGrey300,
        ),
        spaceVertical(height: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AssetSVGName.walletStatus,
              width: 24,
              height: 24,
            ),
            spaceHorizontal(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.textPlusJakarta(
                      text: 'Nạp tiền', style: TextAppStyle.h6()),
                  spaceVertical(height: 4),
                  CustomText.textPlusJakarta(
                      text: '11-11-2023',
                      style: TextAppStyle.size12W400()
                          .copyWith(color: AppColor.colorUnknown4)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText.textPlusJakarta(
                    text: '${Utils.formatBalance('100000')}đ',
                    style: TextAppStyle.h6()),
                spaceVertical(height: 4),
                CustomText.textPlusJakarta(
                    text: 'Hoàn thành',
                    style: TextAppStyle.size12W400()
                        .copyWith(color: AppColor.colorBlue1)),
              ],
            ),
          ],
        ),
        spaceVertical(height: 16),
      ],
    );
  }
}
