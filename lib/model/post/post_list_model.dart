// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

PostsModel postsModelFromJson(String str) =>
    PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  String? message;
  List<PostsDataModel>? data;

  PostsModel({
    this.message,
    this.data,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        message: json["message"],
        data: List<PostsDataModel>.from(
            json["data"].map((x) => PostsDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PostsDataModel {
  int? id;
  int? idType;
  bool? isDeleted;
  int? idUserTo;
  String? title;
  dynamic totalViewer;
  String? addressSlot;
  int? priceSlot;
  int? quantitySlot;
  String? levelSlot;
  String? categorySlot;
  String? contentPost;
  String? imgUrl;
  bool? status;
  String? days;
  String? startTime;
  String? endTime;
  dynamic idTypeNavigation;
  IdUserToNavigation? idUserToNavigation;
  List<dynamic>? slots;
  String? savedDate;
  String? imageUrls;

  PostsDataModel({
    this.id,
    this.idType,
    this.isDeleted,
    this.idUserTo,
    this.title,
    this.totalViewer,
    this.addressSlot,
    this.priceSlot,
    this.quantitySlot,
    this.levelSlot,
    this.categorySlot,
    this.contentPost,
    this.imgUrl,
    this.status,
    this.days,
    this.startTime,
    this.endTime,
    this.idTypeNavigation,
    this.idUserToNavigation,
    this.slots,
    this.savedDate,
    this.imageUrls,
  });

  factory PostsDataModel.fromJson(Map<String, dynamic> json) => PostsDataModel(
        id: json["id"]?.toInt(),
        idType: json["idType"]?.toInt(),
        isDeleted: json["isDeleted"],
        idUserTo: json["idUserTo"]?.toInt(),
        title: json["title"],
        totalViewer: json["totalViewer"],
        addressSlot: json["addressSlot"],
        priceSlot: json["priceSlot"]?.toInt(),
        quantitySlot: json["quantitySlot"]?.toInt(),
        levelSlot: json["levelSlot"],
        categorySlot: json["categorySlot"],
        contentPost: json["contentPost"],
        imgUrl: json["imgUrl"],
        status: json["status"],
        days: json["days"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        idTypeNavigation: json["idTypeNavigation"],
        idUserToNavigation:
            IdUserToNavigation.fromJson(json["idUserToNavigation"]),
        slots: json["slots"] == null
            ? []
            : List<dynamic>.from(json["slots"].map((x) => x)),
        savedDate: '${json["savedDate"]}',
        imageUrls: json["imageUrls"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idType": idType,
        "isDeleted": isDeleted,
        "idUserTo": idUserTo,
        "title": title,
        "totalViewer": totalViewer,
        "addressSlot": addressSlot,
        "priceSlot": priceSlot,
        "quantitySlot": quantitySlot,
        "levelSlot": levelSlot,
        "categorySlot": categorySlot,
        "contentPost": contentPost,
        "imgUrl": imgUrl,
        "status": status,
        "days": days,
        "startTime": startTime,
        "endTime": endTime,
        "idTypeNavigation": idTypeNavigation,
        "idUserToNavigation": idUserToNavigation?.toJson(),
        "slots": List<dynamic>.from(slots!.map((x) => x)),
        "savedDate": savedDate,
        "imageUrls": imageUrls,
      };
}

class IdUserToNavigation {
  int? id;
  String? userName;
  String? userPassword;
  String? fullName;
  dynamic gender;
  String? phoneNumber;
  dynamic isActive;
  String? imgUrl;
  double? totalRate;
  double? rate;
  dynamic userRole;
  String? deviceToken;
  String? email;
  String? playingArea;
  int? playingLevel;
  String? playingWay;
  String? sortProfile;
  String? createDate;
  String? lastLoginDate;
  bool? isBanFromLogin;
  String? userRoleNavigation;
  List<dynamic>? posts;
  List<dynamic>? tokens;
  List<dynamic>? transactions;
  List<dynamic>? userRatings;
  List<dynamic>? wallets;
  List<dynamic>? notifications;

  IdUserToNavigation({
    this.id,
    this.userName,
    this.userPassword,
    this.fullName,
    this.gender,
    this.phoneNumber,
    this.isActive,
    this.imgUrl,
    this.totalRate,
    this.rate,
    this.userRole,
    this.deviceToken,
    this.email,
    this.playingArea,
    this.playingLevel,
    this.playingWay,
    this.sortProfile,
    this.createDate,
    this.lastLoginDate,
    this.isBanFromLogin,
    this.userRoleNavigation,
    this.posts,
    this.tokens,
    this.transactions,
    this.userRatings,
    this.wallets,
    this.notifications,
  });

  factory IdUserToNavigation.fromJson(Map<String, dynamic> json) =>
      IdUserToNavigation(
        id: json["id"]?.toInt(),
        userName: json["userName"],
        userPassword: json["userPassword"],
        fullName: json["fullName"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
        isActive: json["isActive"],
        imgUrl: json["imgUrl"],
        totalRate: json["totalRate"]?.toDouble(),
        rate: json["rate"]?.toDouble(),
        userRole: json["userRole"],
        deviceToken: json["deviceToken"],
        email: json["email"],
        playingArea: json["playingArea"],
        playingLevel: json["playingLevel"]?.toInt(),
        playingWay: json["playingWay"],
        sortProfile: json["sortProfile"],
        createDate: '${json["createDate"]}',
        lastLoginDate: json["lastLoginDate"],
        isBanFromLogin: json["isBanFromLogin"],
        userRoleNavigation: json["userRoleNavigation"],
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        tokens: List<dynamic>.from(json["tokens"].map((x) => x)),
        transactions: List<dynamic>.from(json["transactions"].map((x) => x)),
        userRatings: List<dynamic>.from(json["userRatings"].map((x) => x)),
        wallets: List<dynamic>.from(json["wallets"].map((x) => x)),
        notifications: List<dynamic>.from(json["notifications"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userPassword": userPassword,
        "fullName": fullName,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "isActive": isActive,
        "imgUrl": imgUrl,
        "totalRate": totalRate,
        "rate": rate,
        "userRole": userRole,
        "deviceToken": deviceToken,
        "email": email,
        "playingArea": playingArea,
        "playingLevel": playingLevel,
        "playingWay": playingWay,
        "sortProfile": sortProfile,
        "createDate": createDate,
        "lastLoginDate": lastLoginDate,
        "isBanFromLogin": isBanFromLogin,
        "userRoleNavigation": userRoleNavigation,
        "posts": List<dynamic>.from(posts!.map((x) => x)),
        "tokens": List<dynamic>.from(tokens!.map((x) => x)),
        "transactions": List<dynamic>.from(transactions!.map((x) => x)),
        "userRatings": List<dynamic>.from(userRatings!.map((x) => x)),
        "wallets": List<dynamic>.from(wallets!.map((x) => x)),
        "notifications": List<dynamic>.from(notifications!.map((x) => x)),
      };
}
