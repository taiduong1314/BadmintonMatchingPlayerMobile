// To parse this JSON data, do
//
//     final historyWalletModel = historyWalletModelFromJson(jsonString);

import 'dart:convert';

HistoryWalletModel historyWalletModelFromJson(String str) => HistoryWalletModel.fromJson(json.decode(str));

String historyWalletModelToJson(HistoryWalletModel data) => json.encode(data.toJson());

class HistoryWalletModel {
  String? message;
  List<HistoryWalletDataModel>? data;

  HistoryWalletModel({
    this.message,
    this.data,
  });

  factory HistoryWalletModel.fromJson(Map<String, dynamic> json) => HistoryWalletModel(
    message: json["message"],
    data: List<HistoryWalletDataModel>.from(json["data"].map((x) => HistoryWalletDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HistoryWalletDataModel {
  int? id;
  int? idWallet;
  int? idUser;
  String? amount;
  String? status;
  String? time;

  HistoryWalletDataModel({
    this.id,
    this.idWallet,
    this.idUser,
    this.amount,
    this.status,
    this.time,
  });

  factory HistoryWalletDataModel.fromJson(Map<String, dynamic> json) => HistoryWalletDataModel(
    id: json["id"]?.toInt(),
    idWallet: json["idWallet"]?.toInt(),
    idUser: json["idUser"]?.toInt(),
    amount: json["amount"],
    status: json["status"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id?.toInt(),
    "idWallet": idWallet,
    "idUser": idUser,
    "amount": amount,
    "status": status,
    "time": time,
  };
}
