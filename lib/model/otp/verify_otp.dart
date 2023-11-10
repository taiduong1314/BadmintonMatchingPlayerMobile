import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  String? otp;
  String? token;
  String? errorCode;

  VerifyOtpModel({
    this.otp,
    this.token,
    this.errorCode,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        otp: json["otp"],
        token: json["token"],
        errorCode: json["errorCode"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "token": token,
        "errorCode": errorCode,
      };
}
