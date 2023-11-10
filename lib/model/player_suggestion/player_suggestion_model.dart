import 'dart:convert';

PlayerSuggestionModel playerSuggestionModelFromJson(String str) => PlayerSuggestionModel.fromJson(json.decode(str));

String playerSuggestionModelToJson(PlayerSuggestionModel data) => json.encode(data.toJson());

class PlayerSuggestionModel {
  String? message;
  List<PlayerSuggestionDataModel>? data;

  PlayerSuggestionModel({
    this.message,
    this.data,
  });

  factory PlayerSuggestionModel.fromJson(Map<String, dynamic> json) => PlayerSuggestionModel(
    message: json["message"],
    data: List<PlayerSuggestionDataModel>.from(json["data"].map((x) => PlayerSuggestionDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PlayerSuggestionDataModel {
  int? id;
  String? name;
  String? imageUrl;
  String? shortProfile;
  double? rating;

  PlayerSuggestionDataModel({
    this.id,
    this.name,
    this.imageUrl,
    this.shortProfile,
    this.rating,
  });

  factory PlayerSuggestionDataModel.fromJson(Map<String, dynamic> json) =>
      PlayerSuggestionDataModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        shortProfile: json["shortProfile"],
        rating: json["rating"] == null ? 0 : json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "shortProfile": shortProfile,
        "rating": rating,
      };
}
