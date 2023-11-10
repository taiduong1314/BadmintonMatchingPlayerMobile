import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  String? message;
  String? errorCode;

  ForgotPasswordModel({
    this.message,
    this.errorCode,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    message: json["message"],
    errorCode: json["errorCode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errorCode": errorCode,
  };
}
