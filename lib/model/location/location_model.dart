import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) => List<LocationModel>.from(json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  int? id;
  String? name;
  int? cityId;

  LocationModel({
    this.id,
    this.name,
    this.cityId,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
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
