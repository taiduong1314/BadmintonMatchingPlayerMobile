import 'dart:convert';

ListChatDetailModel listChatDetailModelFromJson(String str) =>
    ListChatDetailModel.fromJson(json.decode(str));

String listChatDetailModelToJson(ListChatDetailModel data) =>
    json.encode(data.toJson());

class ListChatDetailModel {
  String? message;
  List<ChatDetailModel>? data;

  ListChatDetailModel({
    this.message,
    this.data,
  });

  factory ListChatDetailModel.fromJson(Map<String, dynamic> json) =>
      ListChatDetailModel(
        message: json["message"],
        data: List<ChatDetailModel>.from(
            json["data"].map((x) => ChatDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ChatDetailModel {
  int? messageId;
  String? message;
  int? userId;
  String? sendTime;
  String? sendUserName;
  bool? isImage;
  bool? isFrom;

  ChatDetailModel({
    this.messageId,
    this.message,
    this.userId,
    this.sendTime,
    this.sendUserName,
    this.isImage,
    this.isFrom,
  });

  factory ChatDetailModel.fromJson(Map<String, dynamic> json) =>
      ChatDetailModel(
        messageId: json["messageId"],
        message: json["message"],
        userId: json["userId"],
        sendTime: json["sendTime"],
        sendUserName: json["sendUserName"],
        isImage: json["isImage"],
        isFrom: json["isFrom"],
      );

  Map<String, dynamic> toJson() => {
        "messageId": messageId,
        "message": message,
        "userId": userId,
        "sendTime": sendTime,
        "sendUserName": sendUserName,
        "isImage": isImage,
        "isFrom": isFrom,
      };
}
