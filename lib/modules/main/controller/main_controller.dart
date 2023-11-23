import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbmsports/modules/account/view/setting_screen.dart';
import 'package:vbmsports/modules/chat/view/chat_screen.dart';
import 'package:vbmsports/modules/create_post/view/create_post_screen.dart';
import 'package:vbmsports/modules/news/view/news_screen.dart';

import '../../../utils/common/asset/svg.dart';
import '../../home/view/home_screen.dart';

class MainController extends GetxController {
  List listTitleBottomBar = ['Trang chủ', 'Chat', '', 'Tin tức', 'Thêm'];

  List listImageBottomBar = [
    AssetSVGName.homeBottom,
    AssetSVGName.chatBottom,
    AssetSVGName.centerBottom,
    AssetSVGName.newsBottom,
    AssetSVGName.moreInfoBottom,
  ];

  RxInt indexBottomBar = 0.obs;
  Rx<Widget> mainWidget = Rx<Widget>(HomeScreen());

  void doSelectBottomBar(index) {
    indexBottomBar.value = index;

    switch (index) {
      case 0:
        mainWidget.value = HomeScreen();
        break;
      case 1:
        mainWidget.value = ChatScreen();
        break;
      case 2:
        mainWidget.value = CreatePostScreen();
        break;
      case 3:
        mainWidget.value = NewsScreen();
        break;
      case 4:
        mainWidget.value = AccountScreen();
        break;
    }
  }
}
