// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? message;
  UserDataModel? data;

  UserModel({
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        data: json["data"] == null ? UserDataModel() : UserDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());
UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

class UserDataModel {
  String? userName;
  String? avatar;
  String? token;
  bool? isNewUser;
  String? playingArea;
  int? playingLevel;
  String? playingWay;
  String? fullName;
  String? phoneNumber;
  String? sortProfile;
  int? id;
  double? balance;

  UserDataModel({
    this.userName,
    this.avatar,
    this.token,
    this.isNewUser,
    this.playingArea,
    this.playingLevel,
    this.playingWay,
    this.fullName,
    this.phoneNumber,
    this.sortProfile,
    this.id,
    this.balance,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userName: json["userName"],
        avatar: json["avatar"],
        token: json["token"],
        isNewUser: json["isNewUser"],
        playingArea: json["playingArea"],
        playingLevel: json["playingLevel"],
        playingWay: json["playingWay"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        sortProfile: json["sortProfile"],
        id: json["id"].toInt(),
        balance: json["balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "avatar": avatar,
        "token": token,
        "isNewUser": isNewUser,
        "playingArea": playingArea,
        "playingLevel": playingLevel,
        "playingWay": playingWay,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "sortProfile": sortProfile,
        "id": id,
        "balance": balance,
      };
}
