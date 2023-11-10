import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) =>
    json.encode(data.toJson());

class NotificationsModel {
  String? message;
  List<NotificationDataModel>? data;

  NotificationsModel({
    this.message,
    this.data,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<NotificationDataModel>.from(
                json["data"].map((x) => NotificationDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NotificationDataModel {
  int? id;
  String? avatar;
  String? name;
  String? content;
  String? time;

  NotificationDataModel({
    this.id,
    this.avatar,
    this.name,
    this.content,
    this.time,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        id: json["id"],
        avatar: json["avatar"],
        name: json["name"],
        content: json["content"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "name": name,
        "content": content,
        "time": time,
      };
}
