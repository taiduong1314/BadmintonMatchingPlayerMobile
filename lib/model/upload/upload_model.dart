import 'dart:convert';

UploadModel uploadModelFromJson(String str) => UploadModel.fromJson(json.decode(str));

String uploadModelToJson(UploadModel data) => json.encode(data.toJson());

class UploadModel {
  String? imgUrl;

  UploadModel({
    this.imgUrl,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
    imgUrl: json["imgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
  };
}
