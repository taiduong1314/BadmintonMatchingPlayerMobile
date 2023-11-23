import 'dart:convert';

VnPayModel vnPayModelFromJson(String str) => VnPayModel.fromJson(json.decode(str));

String vnPayModelToJson(VnPayModel data) => json.encode(data.toJson());

class VnPayModel {
  String? message;
  VnPayDataModel? data;

  VnPayModel({
    this.message,
    this.data,
  });

  factory VnPayModel.fromJson(Map<String, dynamic> json) => VnPayModel(
    message: json["message"],
    data: VnPayDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
  };
}

class VnPayDataModel {
  String? name;
  String? uri;

  VnPayDataModel({
    this.name,
    this.uri,
  });

  factory VnPayDataModel.fromJson(Map<String, dynamic> json) => VnPayDataModel(
    name: json["name"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "uri": uri,
  };
}
