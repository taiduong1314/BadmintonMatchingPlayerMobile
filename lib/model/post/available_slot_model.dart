import 'dart:convert';

AvailableSlotModel availableSlotModelFromJson(String str) =>
    AvailableSlotModel.fromJson(json.decode(str));

String availableSlotModelToJson(AvailableSlotModel data) =>
    json.encode(data.toJson());

class AvailableSlotModel {
  String? message;
  AvailableSlotDataModel? data;

  AvailableSlotModel({
    this.message,
    this.data,
  });

  factory AvailableSlotModel.fromJson(Map<String, dynamic> json) =>
      AvailableSlotModel(
        message: json["message"],
        data: json["data"] == null
            ? AvailableSlotDataModel(transactionId: null)
            : AvailableSlotDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class AvailableSlotDataModel {
  int? transactionId;
  List<ChatInfo>? chatInfos;

  AvailableSlotDataModel({
    this.transactionId,
    this.chatInfos,
  });

  factory AvailableSlotDataModel.fromJson(Map<String, dynamic> json) =>
      AvailableSlotDataModel(
        transactionId: json["transactionId"],
        chatInfos: json["chatInfos"] == null ? [] : List<ChatInfo>.from(
            json["chatInfos"].map((x) => ChatInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "chatInfos": List<dynamic>.from(chatInfos!.map((x) => x.toJson())),
      };
}

class ChatInfo {
  int? roomId;
  String? playDate;

  ChatInfo({
    this.roomId,
    this.playDate,
  });

  factory ChatInfo.fromJson(Map<String, dynamic> json) => ChatInfo(
        roomId: json["roomId"],
        playDate: json["playDate"],
      );

  Map<String, dynamic> toJson() => {
        "roomId": roomId,
        "playDate": playDate,
      };
}
