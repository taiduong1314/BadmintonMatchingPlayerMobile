// To parse this JSON data, do
//
//     final joinedPostsModel = joinedPostsModelFromJson(jsonString);

import 'dart:convert';

JoinedPostsModel joinedPostsModelFromJson(String str) =>
    JoinedPostsModel.fromJson(json.decode(str));

String joinedPostsModelToJson(JoinedPostsModel data) =>
    json.encode(data.toJson());

class JoinedPostsModel {
  String? message;
  List<JoinedPostDataModel>? data;

  JoinedPostsModel({
    this.message,
    this.data,
  });

  factory JoinedPostsModel.fromJson(Map<String, dynamic> json) =>
      JoinedPostsModel(
        message: json["message"],
        data: List<JoinedPostDataModel>.from(
            json["data"].map((x) => JoinedPostDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JoinedPostDataModel {
  int? postId;
  String? postTitle;
  String? startTime;
  String? endTime;
  String? availableSlot;
  String? status;
  String? areaName;
  int? moneyPaid;
  int? transacionId;
  String? coverImage;
  List<BookedInfo>? bookedInfos;
  bool? canReport;
  bool? isCancel;
  String? chatRoomUrl;

  JoinedPostDataModel({
    this.postId,
    this.postTitle,
    this.startTime,
    this.endTime,
    this.availableSlot,
    this.status,
    this.areaName,
    this.moneyPaid,
    this.transacionId,
    this.coverImage,
    this.bookedInfos,
    this.canReport,
    this.isCancel,
    this.chatRoomUrl,
  });

  factory JoinedPostDataModel.fromJson(Map<String, dynamic> json) =>
      JoinedPostDataModel(
        postId: json["postId"]?.toInt(),
        postTitle: json["postTitle"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        availableSlot: json["availableSlot"],
        status: json["status"],
        areaName: json["areaName"],
        moneyPaid: json["moneyPaid"]?.toInt(),
        transacionId: json["transacionId"]?.toInt(),
        coverImage: json["coverImage"],
        bookedInfos: List<BookedInfo>.from(
            json["bookedInfos"].map((x) => BookedInfo.fromJson(x))),
        canReport: json["canReport"],
        isCancel: json["isCancel"],
        chatRoomUrl: json["chatRoomUrl"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "postTitle": postTitle,
        "startTime": startTime,
        "endTime": endTime,
        "availableSlot": availableSlot,
        "status": status,
        "areaName": areaName,
        "moneyPaid": moneyPaid,
        "transacionId": transacionId,
        "coverImage": coverImage,
        "bookedInfos": List<dynamic>.from(bookedInfos!.map((x) => x.toJson())),
        "canReport": canReport,
        "isCancel": isCancel,
        "chatRoomUrl": chatRoomUrl,
      };
}

class BookedInfo {
  int? createSlot;
  int? bookedSlot;
  List<dynamic>? imageUrls;

  BookedInfo({
    this.createSlot,
    this.bookedSlot,
    this.imageUrls,
  });

  factory BookedInfo.fromJson(Map<String, dynamic> json) => BookedInfo(
        createSlot: json["createSlot"]?.toInt(),
        bookedSlot: json["bookedSlot"]?.toInt(),
        imageUrls: List<dynamic>.from(json["imageUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "createSlot": createSlot,
        "bookedSlot": bookedSlot,
        "imageUrls": List<dynamic>.from(imageUrls!.map((x) => x)),
      };
}
