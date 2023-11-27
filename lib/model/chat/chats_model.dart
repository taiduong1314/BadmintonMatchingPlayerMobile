// To parse this JSON data, do
//
//     final chatsModel = chatsModelFromJson(jsonString);

import 'dart:convert';

ChatsModel chatsModelFromJson(String str) =>
    ChatsModel.fromJson(json.decode(str));

String chatsModelToJson(ChatsModel data) => json.encode(data.toJson());

class ChatsModel {
  String? message;
  List<ChatDataModel>? data;

  ChatsModel({
    this.message,
    this.data,
  });

  factory ChatsModel.fromJson(Map<String, dynamic> json) => ChatsModel(
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<ChatDataModel>.from(
                json["data"].map((x) => ChatDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ChatDataModel {
  int? roomId;
  String? chatTitle;
  String? coverImg;
  String? lastSendMsg;
  String? lastSendTime;
  String? clientUrl;

  ChatDataModel({
    this.roomId,
    this.chatTitle,
    this.coverImg,
    this.lastSendMsg,
    this.lastSendTime,
    this.clientUrl,
  });

  factory ChatDataModel.fromJson(Map<String, dynamic> json) => ChatDataModel(
        roomId: json["roomId"],
        chatTitle: json["chatTitle"],
        coverImg: json["coverImg"],
        lastSendMsg: json["lastSendMsg"],
        lastSendTime: json["lastSendTime"],
        clientUrl: json["clientUrl"],
      );

  Map<String, dynamic> toJson() => {
        "roomId": roomId,
        "chatTitle": chatTitle,
        "coverImg": coverImg,
        "lastSendMsg": lastSendMsg,
        "lastSendTime": lastSendTime,
        "clientUrl": clientUrl,
      };
}
