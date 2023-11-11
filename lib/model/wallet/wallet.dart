// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  String? message;
  WalletDataModel? data;

  WalletModel({
    this.message,
    this.data,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    message: json["message"],
    data: json["data"] == null ? WalletDataModel() : WalletDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
  };
}

class WalletDataModel {
  int? newBalance;

  WalletDataModel({
    this.newBalance,
  });

  factory WalletDataModel.fromJson(Map<String, dynamic> json) => WalletDataModel(
    newBalance: json["newBalance"]?.toInt(),
  );

  Map<String, dynamic> toJson() => {
    "newBalance": newBalance,
  };
}
