// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  String? message;
  VerifyOtpDataModel? data;

  VerifyOtpModel({
    this.message,
    this.data,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    message: json["message"],
    data: VerifyOtpDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
  };
}

class VerifyOtpDataModel {
  String? otp;
  String? token;

  VerifyOtpDataModel({
    this.otp,
    this.token,
  });

  factory VerifyOtpDataModel.fromJson(Map<String, dynamic> json) => VerifyOtpDataModel(
    otp: json["otp"].toString(),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "token": token,
  };
}
