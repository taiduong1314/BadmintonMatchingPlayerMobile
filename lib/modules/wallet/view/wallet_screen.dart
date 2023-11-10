import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gotrust_popup/utils/space/space.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:vbmsports/utils/common/data.dart';
import 'package:vbmsports/utils/utils.dart';

import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/wallet_controller.dart';

part 'history.dart';

part 'header.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: const AssetImage(AssetImageName.walletHeader),
          width: Get.width,
          height: Get.height / 3.5,
          fit: BoxFit.fill,
        ),
        _mainWidget(),
      ],
    );
  }

  Widget _mainWidget() {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: Get.width,
        height: Get.height,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _wallet(),
            spaceVertical(height: 32),
            Expanded(child: _history())
          ],
        ),
      ),
    );
  }

  Widget _wallet() {
    return SizedBox(
      width: Get.width,
      height: (Get.height / 4) - 10,
      child: Column(
        children: [
          _header(),
          Expanded(
              child: Center(
                child: CustomText.textPlusJakarta(
                    text:
                        '${Utils.formatBalance('${AppDataGlobal.user.value.balance ?? 0}')}đ',
                    style:
                        TextAppStyle.h2().copyWith(color: AppColor.colorLight)),
              )),
          _rowOptionWallet(),
        ],
      ),
    );
  }

  Widget _rowOptionWallet() {
    return Container(
      width: Get.width,
      height: 70,
      decoration: BoxDecoration(
        color: AppColor.colorLight,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.colorGrey300.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  color: Colors.transparent,
                  child: const Image(
                    image: AssetImage(AssetImageName.deposit),
                    height: 53,
                    width: 48,
                  ))),
          Container(
            height: 32,
            width: 0.8,
            color: AppColor.colorGrey300.withOpacity(0.8),
          ),
          Expanded(
              child: Container(
                  color: Colors.transparent,
                  child: const Image(
                    image: AssetImage(AssetImageName.withdraw),
                    height: 53,
                    width: 48,
                  ))),
        ],
      ),
    );
  }
}
