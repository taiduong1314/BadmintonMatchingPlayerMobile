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
        data: json["data"] == null
            ? PostDetailDataModel()
            : PostDetailDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class PostDetailDataModel {
  String? addressSlot;
  int? priceSlot;
  int? quantitySlot;
  List<String>? availableSlot;
  dynamic? levelSlot;
  dynamic? categorySlot;
  String? contentPost;
  String? hightLightImage;
  List<String>? imageUrls;
  String? days;
  String? startTime;
  String? endTime;
  String? fullName;
  double? totalRate;
  String? imgUrlUser;
  String? sortProfile;
  int? userId;
  String? title;
  dynamic? imageStream;

  PostDetailDataModel({
    this.addressSlot,
    this.priceSlot,
    this.quantitySlot,
    this.availableSlot,
    this.levelSlot,
    this.categorySlot,
    this.contentPost,
    this.hightLightImage,
    this.imageUrls,
    this.days,
    this.startTime,
    this.endTime,
    this.fullName,
    this.totalRate,
    this.imgUrlUser,
    this.sortProfile,
    this.userId,
    this.title,
    this.imageStream,
  });

  factory PostDetailDataModel.fromJson(Map<String, dynamic> json) =>
      PostDetailDataModel(
        addressSlot: json["addressSlot"],
        priceSlot: json["priceSlot"]?.toInt(),
        quantitySlot: json["quantitySlot"]?.toInt(),
        availableSlot: List<String>.from(json["availableSlot"].map((x) => x)),
        levelSlot: json["levelSlot"],
        categorySlot: json["categorySlot"],
        contentPost: json["contentPost"],
        hightLightImage: json["hightLightImage"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        days: json["days"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        fullName: json["fullName"],
        totalRate: json["totalRate"]?.toDouble(),
        imgUrlUser: json["imgUrlUser"],
        sortProfile: json["sortProfile"],
        userId: json["userId"]?.toInt(),
        title: json["title"],
        imageStream: json["imageStream"],
      );

  Map<String, dynamic> toJson() => {
        "addressSlot": addressSlot,
        "priceSlot": priceSlot,
        "quantitySlot": quantitySlot,
        "availableSlot": List<dynamic>.from(availableSlot!.map((x) => x)),
        "levelSlot": levelSlot,
        "categorySlot": categorySlot,
        "contentPost": contentPost,
        "hightLightImage": hightLightImage,
        "imageUrls": List<dynamic>.from(imageUrls!.map((x) => x)),
        "days": days,
        "startTime": startTime,
        "endTime": endTime,
        "fullName": fullName,
        "totalRate": totalRate,
        "imgUrlUser": imgUrlUser,
        "sortProfile": sortProfile,
        "userId": userId,
        "title": title,
        "imageStream": imageStream,
      };
}
