
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbmsports/model/post/available_slot_model.dart';
import 'package:vbmsports/model/post/post_detail_model.dart';
import '../../../utils/common/data.dart';

import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class CheckSlotAPI {
  static Future<AvailableSlotModel> post({
    required int postId,
    required List<SlotInfo> slotInfo,
  }) async {
    try {
      List<SlotsInfo> slotsInfo = [];

      for (var element in slotInfo) {
        slotsInfo.add(SlotsInfo(dateRegis: element.startTime, numSlots: element.availableSlot));
      }

      var response = await DioClient(Dio()).post(
        SubAPI.booking,
        data: {
          "userId": AppDataGlobal.user.value.id,
          "postId": postId,
          "slotsInfo": slotsInfo
        },
      );

      if (kDebugMode) {
        print(
            '******** Status Call API CheckSlotAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return availableSlotModelFromJson(jsonEncode(response.data));
      }

      return AvailableSlotModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API CheckSlotAPI: $e');
      }

      return AvailableSlotModel();
    }
  }
}

class SlotsInfo {
  String? dateRegis;
  int? numSlots;

  SlotsInfo({
    this.dateRegis,
    this.numSlots,
  });

  factory SlotsInfo.fromJson(Map<String, dynamic> json) => SlotsInfo(
    dateRegis: json["dateRegis"],
    numSlots: json["numSlots"],
  );

  Map<String, dynamic> toJson() => {
    "dateRegis": dateRegis,
    "numSlots": numSlots,
  };
}