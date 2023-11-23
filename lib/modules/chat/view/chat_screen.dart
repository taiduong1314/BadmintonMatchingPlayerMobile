import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vbmsports/model/chat/chats_model.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:vbmsports/utils/utils.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/loading/load_network_image.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/chat_controller.dart';

part 'search.dart';

part 'body.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({super.key});

  @override
  final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(height: 16),
              _search(),
              spaceVertical(height: 20),
              Expanded(child: SingleChildScrollView(child: _body())),
            ],
          ),
        ),
      ),
    );
  }
}
