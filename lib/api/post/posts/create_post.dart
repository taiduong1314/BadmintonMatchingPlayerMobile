import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/utils/utils.dart';
import '../../../model/post/post_detail_model.dart';
import '../../../utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class CreatePostAPI {
  static Future<bool> post({
    required String levelSlot,
    required String categorySlot,
    required String title,
    required String address,
    required List<SlotInfo> slots,
    required String description,
    required List<String> imgUrls,
    required String highlightUrl,
  }) async {
    try {
      List<SlotResponseModel> listSlots = [];
      String keyToConvert = 'yyyy-MM-ddTHH:mm:ss';

      for (var element in slots) {
        listSlots.add(SlotResponseModel(
          startTime: Utils.convertDateTime(
              date: element.startTime!, dateFormat: keyToConvert),
          endTime: Utils.convertDateTime(
              date: element.endTime!, dateFormat: keyToConvert),
          price: element.price,
          availableSlot: element.availableSlot,
        ));
      }

      var response = await DioClient(Dio()).post(
        '${SubAPI.post}/create_by/${AppDataGlobal.user.value.id}',
        data: {
          "levelSlot": levelSlot,
          "categorySlot": categorySlot,
          "title": title,
          "address": address,
          "slots": listSlots,
          "description": description,
          "highlightUrl": highlightUrl,
          "imgUrls": imgUrls
        },
      );

      if (kDebugMode) {
        print(
            '******** Status Call API CreatePostAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return response.data['data']['postId'] != null;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API CreatePostAPI: $e');
      }

      return false;
    }
  }
}

class SlotResponseModel {
  String? startTime;
  String? endTime;
  int? price;
  int? availableSlot;

  SlotResponseModel({
    this.startTime,
    this.endTime,
    this.price,
    this.availableSlot,
  });

  factory SlotResponseModel.fromJson(Map<String, dynamic> json) =>
      SlotResponseModel(
        startTime: json["startTime"],
        endTime: json["endTime"],
        price: json["price"],
        availableSlot: json["availableSlot"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "price": price,
        "availableSlot": availableSlot,
      };
}
