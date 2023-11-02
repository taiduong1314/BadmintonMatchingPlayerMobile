import 'dart:convert';

List<PlayerSuggestionModel> playerSuggestionModelFromJson(String str) =>
    List<PlayerSuggestionModel>.from(
        json.decode(str).map((x) => PlayerSuggestionModel.fromJson(x)));

String playerSuggestionModelToJson(List<PlayerSuggestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlayerSuggestionModel {
  int? id;
  String? name;
  String? imageUrl;
  String? shortProfile;
  double? rating;

  PlayerSuggestionModel({
    this.id,
    this.name,
    this.imageUrl,
    this.shortProfile,
    this.rating,
  });

  factory PlayerSuggestionModel.fromJson(Map<String, dynamic> json) =>
      PlayerSuggestionModel(
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
