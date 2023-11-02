import 'dart:convert';

UserIdModel userIdModelFromJson(String str) =>
    UserIdModel.fromJson(json.decode(str));

String userIdModelToJson(UserIdModel data) => json.encode(data.toJson());

class UserIdModel {
  int? userId;
  String? errorEmail;

  UserIdModel({
    this.userId,
    this.errorEmail,
  });

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        userId: json["userId"],
        errorEmail: json["errorEmail"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "errorEmail": errorEmail,
      };
}
