// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  String? message;
  UserInfoDataModel? data;

  UserInfoModel({
    this.message,
    this.data,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        message: json["message"],
        data: json["data"] == null
            ? UserInfoDataModel()
            : UserInfoDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class UserInfoDataModel {
  String? fullName;
  double? totalRate;
  String? imgUrl;
  String? sortProfile;
  double? levelSkill;
  double? friendly;
  double? trusted;
  double? helpful;

  UserInfoDataModel({
    this.fullName,
    this.totalRate,
    this.imgUrl,
    this.sortProfile,
    this.levelSkill,
    this.friendly,
    this.trusted,
    this.helpful,
  });

  factory UserInfoDataModel.fromJson(Map<String, dynamic> json) =>
      UserInfoDataModel(
        fullName: json["fullName"],
        totalRate: json["totalRate"]?.toDouble() ?? 5,
        imgUrl: json["imgUrl"],
        sortProfile: json["sortProfile"],
        levelSkill: json["levelSkill"]?.toDouble() ?? 5,
        friendly: json["friendly"]?.toDouble() ?? 5,
        trusted: json["trusted"]?.toDouble() ?? 5,
        helpful: json["helpful"]?.toDouble() ?? 5,
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "totalRate": totalRate,
        "imgUrl": imgUrl,
        "sortProfile": sortProfile,
        "levelSkill": levelSkill,
        "friendly": friendly,
        "trusted": trusted,
        "helpful": helpful,
      };
}
