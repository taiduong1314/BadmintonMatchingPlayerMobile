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
        child: Row(
          children: [
            CustomText.textPlusJakarta(
                text: 'Lịch sử giao dịch', style: TextAppStyle.h6()),
            spaceHorizontal(width: 6),
            if (controller.isLoadingHistory.value)
              Lottie.asset(AssetAnimationCustom.loadingComments,
                  width: 100, height: 40, alignment: Alignment.centerLeft),
          ],
        ));
  }

  Widget _listHistory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ...List.generate(12, (index) => _itemHistory()).toList(),

        ...controller.listData.map((element) => _itemHistory(element)).toList(),
        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }

  Widget _itemHistory(HistoryWalletDataModel item) {
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
                      text: item.type ?? "", style: TextAppStyle.h6()),
                  spaceVertical(height: 4),
                  CustomText.textPlusJakarta(
                      text: item.time == null ? 'Đang cập nhật' : item.time ?? '',
                      style: TextAppStyle.size12W400()
                          .copyWith(color: AppColor.colorUnknown4)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText.textPlusJakarta(
                    text: item.amount == null ? 'Đang cập nhật' : '${Utils.formatBalance(item.amount ?? '')}đ',
                    style: TextStyle(color: item.amount != null && item.amount!.startsWith('-')
                                ? const Color(0xFFAA0000)
                                : const Color(0xFF00AA00))),
                spaceVertical(height: 4),
                CustomText.textPlusJakarta(
                    text: item.status ?? 'Đang cập nhật',
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
