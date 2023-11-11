part of 'deposit_withdraw_screen.dart';

extension BodyCustom on DepositWithdrawScreen {
  Widget _body() {
    return Column(
      children: [
        spaceVertical(height: 24),
        Obx(() => _wallet()),
        spaceVertical(height: 32),
        _inputForm(
            controllerText: controller.txtBalance,
            title: '${controller.isDeposit ? 'Nạp tiền vào ví' : 'Rút tiền từ ví'} (Tối thiểu 10.000đ)',
            hintText: controller.isDeposit
                ? 'Nhập số tiền cần nạp'
                : 'Nhập số tiền muốn rút',
            keyboardType: TextInputType.number),
        const Spacer(),
        _btnConfirm(),
      ],
    );
  }

  Widget _wallet() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.colorGrey300),
      ),
      child: Row(
        children: [
          const Image(
            image: AssetImage(AssetImageName.vbmPay),
            width: 48,
            height: 48,
          ),
          spaceHorizontal(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.textPlusJakarta(
                  text: 'Số dư ví',
                  style: TextAppStyle.bodySmall()
                      .copyWith(color: AppColor.colorUnknown5)),
              spaceVertical(height: 8),
              CustomText.textPlusJakarta(
                  text:
                      '${Utils.formatBalance('${AppDataGlobal.user.value.balance ?? 0}')}đ',
                  style: TextAppStyle.h6()),
            ],
          )),
        ],
      ),
    );
  }

  Widget _btnConfirm() {
    return CustomButton.commonButton(
        title: controller.isDeposit ? 'Nạp' : 'Rút',
        onTap: controller.onTapConfirm);
  }
}
