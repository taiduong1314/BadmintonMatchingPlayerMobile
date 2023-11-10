import 'dart:convert';

UserIdModel userIdModelFromJson(String str) => UserIdModel.fromJson(json.decode(str));

String userIdModelToJson(UserIdModel data) => json.encode(data.toJson());

class UserIdModel {
  String? message;
  String? errorCode;
  UserIdDataModel? data;

  UserIdModel({
    this.message,
    this.errorCode,
    this.data,
  });

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
    message: json["message"],
    errorCode: json["errorCode"],
    data: UserIdDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errorCode": errorCode,
    "data": data?.toJson(),
  };
}

class UserIdDataModel {
  int? userId;

  UserIdDataModel({
    this.userId,
  });

  factory UserIdDataModel.fromJson(Map<String, dynamic> json) => UserIdDataModel(
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
  };
}
