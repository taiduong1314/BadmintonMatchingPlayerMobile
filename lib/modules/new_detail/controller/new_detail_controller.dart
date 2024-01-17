import 'package:get/get.dart';
import 'package:vbmsports/api/get/blogs/get_details_new.dart';
import 'package:html/parser.dart' show parse;
import '../../../model/notification/notification_model.dart';

class NewDetailController extends GetxController {
  NotificationDataModel receiveData = Get.arguments['data'];
  RxBool fetchingData = RxBool(false);
  Rx<NotificationDataModel> dataDetail =
      Rx<NotificationDataModel>(NotificationDataModel());
  @override
  void onInit() async {
    await getNewsDetails();

    super.onInit();
  }

  Future<void> getNewsDetails() async {
    fetchingData.value = false;
    var data = await CallApiGetDetailsPost.get(receiveData.id ?? 0);
    if (data['message'] == 'Success') {
      mapData(data['data']);
    }
  }

  void mapData(dynamic data) {
    fetchingData.value = true;
    dataDetail.value.avatar = data['imgUrl'];
    dataDetail.value.content = data['description'];
    dataDetail.value.id = data['id'];
    dataDetail.value.name = data['userCreateName'];
    dataDetail.value.notiDate = DateTime.now().toString();
    dataDetail.value.time = DateTime.now().toString();
  }

  String removeHtmlTags(String htmlString) {
    var document = parse(htmlString);
    return document.body!.text;
  }
}
