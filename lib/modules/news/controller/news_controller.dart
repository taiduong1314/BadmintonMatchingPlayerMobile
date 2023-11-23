import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vbmsports/routes/app_pages.dart';
import 'package:vbmsports/utils/common/asset/image.dart';

import '../../../model/notification/notification_model.dart';

class NewsController extends GetxController {
  RxList<NotificationDataModel> listNotification = RxList.empty(growable: true);

  List listBanner = [
    AssetImageName.bannerNews,
    AssetImageName.bannerNews,
    AssetImageName.bannerNews
  ];
  RxBool isLoading = true.obs;

  List<String> listImage = [
    'https://i1-thethao.vnecdn.net/2023/07/18/nguyen-thuy-linh-cau-long-bwf-5326-4851-1689649155.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=61x_WriepU8Ue3RuAce7mQ',
    'https://i1-thethao.vnecdn.net/2023/03/15/nguye-n-ha-i-da-ng-nguye-n-tie-3298-3944-1678851870.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=BcOl5CL_8TNdjQUev-09Bw',
    'https://i1-thethao.vnecdn.net/2022/08/23/screenshot-2022-08-23-at-08-59-4900-6451-1661221711.png?w=500&h=300&q=100&dpr=2&fit=crop&s=eNbD5mPkPA7lUaiKztNXyw',
    'https://i1-thethao.vnecdn.net/2019/08/19/nguyen-thi-trang-1566233171-3799-1566233275.png?w=500&h=300&q=100&dpr=2&fit=crop&s=Ea3bJZOay-h1tSzSzhFC6Q',
    'https://i1-thethao.vnecdn.net/2019/04/24/tien-minh-jpg-1556122490-8805-1556122558.png?w=500&h=300&q=100&dpr=2&fit=crop&s=BFrTSrBfEXClv7c5m5ChEA',
    'https://i1-thethao.vnecdn.net/2017/12/18/thylinh-1513532454.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=tJoMYBf6GvdNIHhEmaAv0g',
  ];

  List<String> listTitle = [
    'Thùy Linh tiến gần top 20 thế giới',
    'Tiến Minh mất vị trí số một Việt Nam sau 21 năm',
    'Vũ Thị Trang qua vòng một giải cầu lông thế giới',
    'Vũ Thị Trang vào vòng hai giải cầu lông thế giới',
    'Tiến Minh vào vòng 1/8 giải cầu lông Châu Á',
    'Thùy Linh vô địch giải cầu lông quốc tế Italy',
  ];

  List<String> listContain = [
    '''Nhờ vào tứ kết Mỹ Mở rộng, tay vợt nữ số một Việt Nam Nguyễn Thùy Linh vươn lên thứ 23 trên bảng thứ bậc của Liên đoàn Cầu lông Thế giới (BWF).
    
    Trên đất Mỹ, Thùy Linh lần lượt hạ hai tay vợt chủ nhà là Esther Shi ở vòng 1/16 và Iris Wang ở vòng 1/8 cùng tỷ số 2-1. Đến tứ kết, Thùy Linh thắng set đầu, nhưng thua ngược 1-2 trước hạt giống số một người Thái Lan Ratchanok Intanon.

Nhờ kết quả tại Mỹ Mở rộng, Thùy Linh được cộng 3.850 điểm, tăng ba bậc lên thứ 26 trên bảng BWF để lập cột mốc mới trong sự nghiệp. Tuần trước, tay vợt sinh năm 1997 được cộng 5.040 điểm cũng với thành tích vào tứ kết giải Canada mở rộng. Tính từ đầu năm 2023, Thùy Linh đã nhảy 28 bậc, từ vị trí 51.

Thùy Linh tiếp tục là tay vợt nữ số một Việt Nam, số sáu Đông Nam Á và 18 châu Á. Ở khu vực, Thùy Linh xếp sau bốn tay vợt Thái Lan là Ratchanok Intanon (thứ 7), Pornpawee Chochuwong (10), Busanan Ongbamrungphan (13), Supanida Katethong (16), và tay vợt Indonesia Mariska Tunjung (8). Trong khi đó, vị trí số một thế giới tiếp tục thuộc về Akane Yamaguchi của Nhật Bản.

Trong năm 2023, Thùy Linh đã vô địch Vietnam International Challenge, về nhì Thailand International Challenge. Cuối tháng 8, Linh sẽ sang Đan Mạch dự giải vô địch thế giới, rồi đi Trung Quốc tranh tài tại Asiad 19.

Với vị trí và phong độ hiện tại, Thùy Linh được kỳ vọng đủ khả năng giành vé dự Olympic Paris 2024.''',
    '''Theo bảng thứ tự của Liên đoàn Cầu lông Thế giới (BWF) ngày 14/3, Nguyễn Hải Đăng leo lên số một đơn nam Việt Nam, thay đàn anh Nguyễn Tiến Minh.

Hải Đăng leo năm bậc lên vị trí 163 thế giới, nhờ thành tích vào vòng hai Thailand International Challenge. Cùng lúc, Tiến Minh tụt hai bậc xuống 165 thế giới, do bị loại ngay vòng một tại cùng giải đấu. Kết quả này giúp Hải Đăng trở thành tay vợt đơn nam số một Việt Nam, còn Tiến Minh rơi xuống thứ hai.

Đây là lần đầu tiên Tiến Minh mất vị trí số một Việt Nam ở BWF. Anh bắt đầu thi đấu quốc tế năm 2002, chỉ đứng thứ 252 khi đó, nhưng đã là số một Việt Nam. Kể từ đó, Tiến Minh trải qua 21 năm vững vàng ở vị trí số một quốc gia.

Vị trí cao nhất của anh tại BWF là thứ năm, ngày 2/12/2010, sau Lee Chong Wei, Peter Gade, Taufik Hidayat và Boonsak Ponsana. Khi đó, anh đứng trên cả những cựu vô địch Olympic và thế giới như Lin Dan hay Chen Long.

Trước Hải Đăng, từng có nhiều tay vợt đàn em nổi lên, nhưng chưa ai chiếm được vị trí số một của Tiến Minh. Nổi bật trong số đó có Phạm Cao Cường - từng giành vị trí 73 thế giới đầu năm 2019, nhưng khi đó Tiến Minh vẫn vững vàng trong Top 60 thế giới.

Tiến Minh lần đầu rơi khỏi Top 100 thế giới ngày 30/8/2022, chấm dứt hơn 16 năm ở nhóm này. Trong vài tháng qua, do thành tích không tốt ở các giải quốc tế, tay vợt 40 tuổi cũng chỉ đứng trên Hải Đăng vài bậc. Đến hôm 14/3, anh bị tay vợt 23 tuổi vượt qua, chấm dứt một kỷ nguyên.

Tiến Minh sinh ngày 12/2/1983 tại TP HCM, từng đoạt HC đồng thế giới năm 2013 và châu Á năm 2019. Anh từng 11 năm liền vô địch quốc gia giai đoạn 2002-2013, và chuỗi này chấm dứt chỉ vì anh không dự giải năm 2014. Tiến Minh đang giữ kỷ lục thế giới 13 lần dự World Championships, từng được BWF khen vì "sự bền bỉ" cho cầu lông.

Hải Đăng sinh ngày 24/9/2000 cũng tại TP HCM, thuận tay trái và có thể hình khá giống Tiến Minh. Vị trí 163 thế giới hiện tại cũng là thứ tự tốt nhất của anh tại BWF. ''',
    '''Tay vợt nữ số hai Việt Nam hạ Kristin Kuuba 21-12, 21-15 ở vòng một giải đấu đang diễn ra tại Thụy Sĩ, hôm 19/8.

Trước đối thủ đứng thứ 76 thế giới người Estonia, Vũ Thị Trang nhỉnh hơn trong cả hai set. Kuuba nhập cuộc tốt hơn khi dẫn 6-4 rồi 7-6. Sau đó, tay vợt quê Bắc Giang ngược dòng và dần tạo khoảng cách lớn 12-9, 16-10 rồi 21-12. Sang set hai, cô vượt lên ngay từ những điểm đầu tiên để kết thúc trận đấu với hai set trắng. Vũ Thị Trang sẽ gặp hạt giống số 15 Line Kjærsfeldt ở vòng hai ngày 21/8.

Đây là lần thứ hai liên tiếp Vũ Thị Trang - số 59 thế giới - vào vòng hai giải cầu lông thế giới. Năm ngoái, tại Nam Kinh (Trung Quốc), cô thắng Neslihan Yigit ở vòng một, rồi thua hạt giống số chín Sung Yi-hyun ở vòng hai. Thành tích tốt nhất của tay vợt 27 tuổi tại giải là vòng ba năm 2014, khi cô lần đầu tiên dự giải.

Ở nội dung đơn nam, chồng của Vũ Thị Trang - NguyễnTiến Minh - dừng bước ở vòng một trước Lin Dan. Phạm Cao Cường cũng nhanh chóng gác vợt trước hạt giống số một Kento Momota. Cả hai đại diện đơn nam của Việt Nam đều chia tay giải.

Ở nội dung đôi nam nữ, Đỗ Tuấn Đức và Phạm Như Thảo thắng Paweł Smiłowski và Magdalena Swierczynska 21-12, 21-13. Đây là năm thứ hai đôi vợt 23 tuổi dự giải, và đều vượt qua vòng một. Ở vòng hai, họ sẽ gặp hạt giống số 11. Đó là vợ chồng nhà Adcock - Chris và Gabrielle.

Đại diện còn lại của Việt Nam - Nguyễn Thùy Linh - sẽ đánh vòng một đơn nữ gặp tay vợt số 90 thế giới Lianne Tan trong hôm nay 20/8. ''',
    '''Tay vợt số một Việt Nam hạ Pui Pang Fong 21-23, 21-11, 21-9 ở trận ra quân hôm 24/4 tại Vũ Hán (Trung Quốc).

Ngay từ đầu trận, Nguyễn Tiến Minh đã thể hiện đẳng cấp của cựu số năm thế giới khi vượt lên dẫn 15-9. Nhưng, tay vợt người Malaysia ghi liền bảy điểm để lần đầu vượt lên. Hai tay vợt giành giật từng điểm cho đến khi Tiến Minh có cơ hội thắng game đầu với tỷ số 21-20. Đó là lúc Pang Fong - nhà vô địch Macau (Trung Quốc) - ghi ba điểm để vươn lên dẫn 1-0.

Pang Fong lần đầu lọt vào vòng đấu chính tại giải, sau ba năm liền gục ngã ở vòng loại. Tay vợt 19 tuổi thắng đại diện của Uzbekistan và Brunei với hai game trắng. Anh có lợi thế tâm lý khi bước vào game hai, nhưng đó là lúc Tiến Minh bộc lộ kinh nghiệm. Tay vợt 36 tuổi ghi liền bảy và năm điểm ở đầu hai game còn lại, không cho đối thủ trẻ có cơ hội bám đuổi.

Tiến Minh sẽ gặp tay vợt người Indonesia - Shesar Hiren Rhustavito - ở vòng 1/8 hôm 25/4. Đây là thử thách cho tay vợt số một Việt Nam khi Rhustavito đang đứng thứ 51 thế giới, trên Tiến Minh 24 bậc. Đó là chưa kể Rhustavito vừa hạ hạt giống số năm Srikanth Kidambi. Nếu vào tứ kết, Tiến Minh có thể gặp nhà vô địch Olympic 2016 - Chen Long.

Trong các đại diện của Việt Nam ngoài Tiến Minh, chỉ có Nguyễn Thùy Linh vượt qua vòng một. Tay vợt 21 tuổi hạ Yeung Sum Yee ở vòng một với tỷ số 21-12, 21-16. Nhưng, cô phải đụng độ hạt giống số năm người Trung Quốc - Hà Băng Kiều (He Bingjiao) - ở vòng 1/8.

Vũ Thị Trang - vợ của Tiến Minh - gặp ngay hạt giống số một Trần Vũ Phi (Chen Yufei) ở trận ra quân và thua 8-21, 12-21. Đôi VĐV Đỗ Tuấn Đức và Phạm Như Thảo cũng thua ngay vòng một trước Rivandi và Mentari ở nội dung đôi nam nữ.

Giải cầu lông châu Á được tổ chức từ năm 1962, đến năm 1991 bắt đầu diễn ra thường niên. Thành tích cao nhất của một đại diện Việt Nam tại giải là Tiến Minh ở tứ kết năm 2011. Giải năm nay diễn ra từ 23/4 đến 28/4.''',
    '''Tay vợt nữ số hai Việt Nam đoạt chức vô địch thứ ba trong năm 2017, sau hai giải Series ở Mông Cổ và Lào.

Trong trận chung kết đơn nữ ngày 17/12, Nguyễn Thùy Linh (thứ 80 thế giới) hạ gục Line Christophersen (299 thế giới) với điểm sát nút 24-22, 16-21 và 23-21 qua 56 phút. Tay vợt người Phú Thọ nhận gần 2.000 đôla tiền thưởng và có thêm 4.000 điểm.

Đây là lần đầu tiên Thùy Linh vô địch một giải Challenge – đứng thứ tư hệ thống cầu lông quốc tế, sau các giải của BWF, Super Series và Grand Prix. Tay vợt 20 tuổi đánh bại bốn đối thủ khác trên đường tới chung kết, trong lần đầu tiên một mình du đấu châu Âu.

Ngôi vương ở đất nước hình chiếc ủng có thể đưa Thùy Linh vào top 70 thế giới trong bảng xếp hạng BWF vào thứ Năm tới. So với cách đây hơn hai năm khi cô còn đứng ngoài top 200, đây là bước tiến đáng kể. Thùy Linh được coi như tay vợt sẽ kế tục Vũ Thị Trang để trở thành số một Việt Nam trong tương lai.

Tại SEA Games 2017, Thùy Linh lọt đến tứ kết và chỉ chịu gác vợt trước đối thủ chủ nhà Malaysia – Sonia Cheah Su Ya.''',
    '''Tay vợt nữ số hai Việt Nam đoạt chức vô địch thứ ba trong năm 2017, sau hai giải Series ở Mông Cổ và Lào.

Trong trận chung kết đơn nữ ngày 17/12, Nguyễn Thùy Linh (thứ 80 thế giới) hạ gục Line Christophersen (299 thế giới) với điểm sát nút 24-22, 16-21 và 23-21 qua 56 phút. Tay vợt người Phú Thọ nhận gần 2.000 đôla tiền thưởng và có thêm 4.000 điểm.

Đây là lần đầu tiên Thùy Linh vô địch một giải Challenge – đứng thứ tư hệ thống cầu lông quốc tế, sau các giải của BWF, Super Series và Grand Prix. Tay vợt 20 tuổi đánh bại bốn đối thủ khác trên đường tới chung kết, trong lần đầu tiên một mình du đấu châu Âu.

Ngôi vương ở đất nước hình chiếc ủng có thể đưa Thùy Linh vào top 70 thế giới trong bảng xếp hạng BWF vào thứ Năm tới. So với cách đây hơn hai năm khi cô còn đứng ngoài top 200, đây là bước tiến đáng kể. Thùy Linh được coi như tay vợt sẽ kế tục Vũ Thị Trang để trở thành số một Việt Nam trong tương lai.

Tại SEA Games 2017, Thùy Linh lọt đến tứ kết và chỉ chịu gác vợt trước đối thủ chủ nhà Malaysia – Sonia Cheah Su Ya.''',
  ];
  RxInt indexBanner = 0.obs;

  @override
  void onInit() {
    setLocal();
    handleInit();
    super.onInit();
  }

  void setLocal() async {
    await Jiffy.setLocale('vi');
  }

  void handleInit() async {
    await EasyLoading.show();
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < 6; i++) {
      listNotification.add(NotificationDataModel(
          id: 0,
          avatar: listImage[i],
          name: listTitle[i],
          content: listContain[i],
          time: '${DateTime.now().subtract(Duration(minutes: i))}'));
    }
    isLoading.value = false;
    await EasyLoading.dismiss();
  }

  void onTapDetail(NotificationDataModel data) {
    Get.toNamed(Routes.NEWDETAIL, arguments: {"data": data});
  }
}
