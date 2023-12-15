// To parse this JSON data, do
//
//     final postDetailModel = postDetailModelFromJson(jsonString);

import 'dart:convert';

PostDetailModel postDetailModelFromJson(String str) =>
    PostDetailModel.fromJson(json.decode(str));

String postDetailModelToJson(PostDetailModel data) =>
    json.encode(data.toJson());

class PostDetailModel {
  String? message;
  PostDetailDataModel? data;

  PostDetailModel({
    this.message,
    this.data,
  });

  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      PostDetailModel(
        message: json["message"],
        data: PostDetailDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class PostDetailDataModel {
  String? addressSlot;
  String? levelSlot;
  String? categorySlot;
  String? contentPost;
  String? hightLightImage;
  List<String>? imageUrls;
  String? fullName;
  double? totalRate;
  String? imgUrlUser;
  String? sortProfile;
  int? userId;
  String? title;
  int? transacionId;
  List<SlotInfo>? slotInfos;
  bool? isPayment;
  bool? canReport;
  bool? isCancel;
  String? chatRoomUrl;

  PostDetailDataModel({
    this.addressSlot,
    this.levelSlot,
    this.categorySlot,
    this.contentPost,
    this.hightLightImage,
    this.imageUrls,
    this.fullName,
    this.totalRate,
    this.imgUrlUser,
    this.sortProfile,
    this.userId,
    this.title,
    this.slotInfos,
    this.isPayment,
    this.transacionId,
    this.canReport,
    this.isCancel,
    this.chatRoomUrl,
  });

  factory PostDetailDataModel.fromJson(Map<String, dynamic> json) =>
      PostDetailDataModel(
        addressSlot: json["addressSlot"],
        levelSlot: json["levelSlot"],
        categorySlot: json["categorySlot"],
        contentPost: json["contentPost"],
        hightLightImage: json["hightLightImage"],
        imageUrls: json["imageUrls"] == null
            ? []
            : List<String>.from(json["imageUrls"].map((x) => x)),
        fullName: json["fullName"],
        totalRate: json["totalRate"]?.toDouble(),
        imgUrlUser: json["imgUrlUser"],
        sortProfile: json["sortProfile"],
        userId: json["userId"]?.toInt(),
        title: json["title"],
        slotInfos: json["slotInfos"] == null
            ? []
            : List<SlotInfo>.from(
                json["slotInfos"].map((x) => SlotInfo.fromJson(x))),
        isPayment: json["isPayment"],
        transacionId: json["transacionId"],
        canReport: json["canReport"],
        isCancel: json["isCancel"],
        chatRoomUrl: json["chatRoomUrl"],
      );

  Map<String, dynamic> toJson() => {
        "addressSlot": addressSlot,
        "levelSlot": levelSlot,
        "categorySlot": categorySlot,
        "contentPost": contentPost,
        "hightLightImage": hightLightImage,
        "imageUrls": List<dynamic>.from(imageUrls!.map((x) => x)),
        "fullName": fullName,
        "totalRate": totalRate,
        "imgUrlUser": imgUrlUser,
        "sortProfile": sortProfile,
        "userId": userId,
        "title": title,
        "slotInfos": List<dynamic>.from(slotInfos!.map((x) => x.toJson())),
        "isPayment": isPayment,
        "transacionId": transacionId,
        "canReport": canReport,
        "isCancel": isCancel,
      };
}

class SlotInfo {
  String? startTime;
  String? endTime;
  int? price;
  int? availableSlot;
  String? saveData;

  SlotInfo({
    this.startTime,
    this.endTime,
    this.price,
    this.availableSlot,
    this.saveData,
  });

  factory SlotInfo.fromJson(Map<String, dynamic> json) => SlotInfo(
        startTime: json["startTime"],
        endTime: json["endTime"],
        price: json["price"],
        availableSlot: json["availableSlot"],
        saveData: json["saveData"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "price": price,
        "availableSlot": availableSlot,
        "saveData": saveData,
      };
}
