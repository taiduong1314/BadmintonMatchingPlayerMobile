import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  String? message;
  List<LocationDataModel>? data;

  LocationModel({
    this.message,
    this.data,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<LocationDataModel>.from(
            json["data"].map((x) => LocationDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LocationDataModel {
  int? id;
  String? name;
  int? cityId;

  LocationDataModel({
    this.id,
    this.name,
    this.cityId,
  });

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      LocationDataModel(
        id: json["id"],
        name: json["name"],
        cityId: json["cityId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cityId": cityId,
      };
}
