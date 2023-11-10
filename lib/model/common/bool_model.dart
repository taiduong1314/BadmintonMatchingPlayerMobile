
import 'dart:convert';

BoolModel boolModelFromJson(String str) => BoolModel.fromJson(json.decode(str));

String boolModelToJson(BoolModel data) => json.encode(data.toJson());

class BoolModel {
  String? message;
  bool? data;

  BoolModel({
    this.message,
    this.data,
  });

  factory BoolModel.fromJson(Map<String, dynamic> json) => BoolModel(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
