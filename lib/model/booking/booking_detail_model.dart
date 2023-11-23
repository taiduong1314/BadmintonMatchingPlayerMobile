// To parse this JSON data, do
//
//     final bookingDetailModel = bookingDetailModelFromJson(jsonString);

import 'dart:convert';

BookingDetailModel bookingDetailModelFromJson(String str) => BookingDetailModel.fromJson(json.decode(str));

String bookingDetailModelToJson(BookingDetailModel data) => json.encode(data.toJson());

class BookingDetailModel {
  String? message;
  BookingDetailDataModel? data;

  BookingDetailModel({
    this.message,
    this.data,
  });

  factory BookingDetailModel.fromJson(Map<String, dynamic> json) => BookingDetailModel(
    message: json["message"],
    data: json["data"] == null ? BookingDetailDataModel() : BookingDetailDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class BookingDetailDataModel {
  int? id;
  int? slotCount;
  List<Slot>? slots;
  String? buyerName;
  String? payTime;
  String? total;
  Post? post;

  BookingDetailDataModel({
    this.id,
    this.slotCount,
    this.slots,
    this.buyerName,
    this.payTime,
    this.total,
    this.post,
  });

  factory BookingDetailDataModel.fromJson(Map<String, dynamic> json) => BookingDetailDataModel(
    id: json["id"],
    slotCount: json["slotCount"],
    slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
    buyerName: json["buyerName"],
    payTime: json["payTime"],
    total: json["total"],
    post: Post.fromJson(json["post"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slotCount": slotCount,
    "slots": List<dynamic>.from(slots!.map((x) => x.toJson())),
    "buyerName": buyerName,
    "payTime": payTime,
    "total": total,
    "post": post!.toJson(),
  };
}

class Post {
  int? id;
  String? title;
  String? titleImage;
  List<String>? imageUrls;
  String? pricePerSlot;
  String? address;
  String? startTime;
  String? endTime;

  Post({
    this.id,
    this.title,
    this.titleImage,
    this.imageUrls,
    this.pricePerSlot,
    this.address,
    this.startTime,
    this.endTime,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    titleImage: json["titleImage"],
    imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
    pricePerSlot: json["pricePerSlot"],
    address: json["address"],
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "titleImage": titleImage,
    "imageUrls": List<dynamic>.from(imageUrls!.map((x) => x)),
    "pricePerSlot": pricePerSlot,
    "address": address,
    "startTime": startTime,
    "endTime": endTime,
  };
}

class Slot {
  int? id;
  String? playDate;

  Slot({
    this.id,
    this.playDate,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    id: json["id"],
    playDate: json["playDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "playDate": playDate,
  };
}
