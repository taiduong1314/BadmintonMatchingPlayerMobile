import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vbmsports/api/get/blogs/get_news.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/common/asset/image.dart';
import 'package:html/parser.dart' show parse;
import '../../../model/notification/notification_model.dart';

class NewsController extends GetxController {
  RxList<NotificationDataModel> listNotification = RxList.empty(growable: true);

  List listBanner = [
    AssetImageName.bannerNews,
    AssetImageName.bannerNews,
    AssetImageName.bannerNews
  ];
  RxBool isLoading = true.obs;

  RxInt indexBanner = 0.obs;
  Rx<dynamic> newsData = Rx<dynamic>(null);
  Rx<dynamic> newsList = Rx<dynamic>(null);

  @override
  void onInit() {
    getNews();
    setLocal();
    super.onInit();
  }

  void setLocal() async {
    // await Jiffy.setLocale('vi');
  }

  void handleInit() async {
    await EasyLoading.show();
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < newsList.value.length; i++) {
      listNotification.add(NotificationDataModel(
          id: newsList.value[i]['id'],
          avatar: newsList.value[i]['imgUrl'],
          name: newsList.value[i]['title'],
          content: removeHtmlTags(newsList.value[i]['shortDescription']),
          time: '${DateTime.now().subtract(Duration(minutes: i))}'));
    }
    isLoading.value = false;
    await EasyLoading.dismiss();
  }

  void getNews() async {
    newsData.value = await CallApiGetPost.get();
    newsList.value = newsData.value['data'];
    handleInit();
  }

  String removeHtmlTags(String htmlString) {
    var document = parse(htmlString);
    return document.body!.text;
  }

  void onTapDetail(NotificationDataModel data) {
    Get.toNamed(Routes.NEWDETAIL, arguments: {"data": data});
  }
}
