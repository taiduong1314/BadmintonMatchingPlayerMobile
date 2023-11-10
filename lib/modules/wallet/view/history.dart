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
        ...List.generate(8, (index) => _itemHistory()).toList(),
        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }

  Widget _itemHistory(){
    return Container();
  }
}
