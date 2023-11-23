// To parse this JSON data, do
//
//     final PostedPostsModel = PostedPostsModelFromJson(jsonString);

import 'dart:convert';

PostedPostsModel postedPostsModelFromJson(String str) => PostedPostsModel.fromJson(json.decode(str));

String postedPostsModelToJson(PostedPostsModel data) => json.encode(data.toJson());

class PostedPostsModel {
  String? message;
  List<PostedPostDataModel>? data;

  PostedPostsModel({
    this.message,
    this.data,
  });

  factory PostedPostsModel.fromJson(Map<String, dynamic> json) => PostedPostsModel(
    message: json["message"],
    data: List<PostedPostDataModel>.from(json["data"].map((x) => PostedPostDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PostedPostDataModel {
  int? postId;
  int? userId;
  String? userName;
  String? sortDescript;
  String? time;
  int? availableSlot;
  String? postImgUrl;
  String? userImgUrl;
  String? address;

  PostedPostDataModel({
    this.postId,
    this.userId,
    this.userName,
    this.sortDescript,
    this.time,
    this.availableSlot,
    this.postImgUrl,
    this.userImgUrl,
    this.address,
  });

  factory PostedPostDataModel.fromJson(Map<String, dynamic> json) => PostedPostDataModel(
    postId: json["postId"],
    userId: json["userId"],
    userName: json["userName"],
    sortDescript: json["sortDescript"],
    time: json["time"],
    availableSlot: json["availableSlot"],
    postImgUrl: json["postImgUrl"],
    userImgUrl: json["userImgUrl"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "userId": userId,
    "userName": userName,
    "sortDescript": sortDescript,
    "time": time,
    "availableSlot": availableSlot,
    "postImgUrl": postImgUrl,
    "userImgUrl": userImgUrl,
    "address": address,
  };
}
