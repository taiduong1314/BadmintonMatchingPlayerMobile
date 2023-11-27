import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../modules/chat_detail/controller/chat_detail_controller.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';

part 'message.dart';

part 'header.dart';

part 'bottom.dart';

class ChatDetailScreen extends GetView<ChatDetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
            width: Get.width,
            height: Get.height,
            color: AppColor.colorLight,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: _header(),
                  ),
                  spaceVertical(height: 20),
                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                            controller: controller.scrollController,
                            child: Container(
                              width: Get.width,
                              padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                              margin: const EdgeInsets.only(bottom: 70),
                              child: Column(
                                children: [
                                  ...controller.chatData.map((chat) {
                                    return
                                        // chat.isFrom == null
                                        //   ? _chatBot(chat.message, chat.sendTime)
                                        //   :
                                        chat.isFrom == true
                                            ? _chatFrom(
                                                chat.message,
                                                chat.sendTime,
                                                isImage: chat.isImage ?? false,
                                              )
                                            : _chatTo(
                                                chat.message,
                                                chat.sendTime,
                                                username: chat.sendUserName,
                                                isImage: chat.isImage ?? false,
                                              );
                                  }).toList(),
                                ],
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            width: Get.width,
                            child: Visibility(
                                visible: controller.statusConnectChat.isTrue,
                                child: _bottomWidget())),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
