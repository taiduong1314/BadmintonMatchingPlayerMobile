import 'dart:convert';

PostSuggestionModel postSuggestionModelFromJson(String str) =>
    PostSuggestionModel.fromJson(json.decode(str));

String postSuggestionModelToJson(PostSuggestionModel data) =>
    json.encode(data.toJson());

class PostSuggestionModel {
  String? message;
  List<PostSuggestionDataModel>? data;

  PostSuggestionModel({
    this.message,
    this.data,
  });

  factory PostSuggestionModel.fromJson(Map<String, dynamic> json) =>
      PostSuggestionModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PostSuggestionDataModel>.from(
                json["data"].map((x) => PostSuggestionDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PostSuggestionDataModel {
  int? idPost;
  String? title;
  String? contentPost;
  String? imgUrlPost;
  String? addressSlot;
  String? days;
  String? startTime;
  String? endTime;
  int? quantitySlot;
  String? fullName;
  String? userImgUrl;
  String? highlightUrl;
  int? price;

  PostSuggestionDataModel({
    this.idPost,
    this.title,
    this.contentPost,
    this.imgUrlPost,
    this.addressSlot,
    this.days,
    this.startTime,
    this.endTime,
    this.quantitySlot,
    this.fullName,
    this.userImgUrl,
    this.highlightUrl,
    this.price,
  });

  factory PostSuggestionDataModel.fromJson(Map<String, dynamic> json) =>
      PostSuggestionDataModel(
        idPost: json["idPost"].toInt(),
        title: json["title"],
        contentPost: json["contentPost"],
        imgUrlPost: json["imgUrlPost"],
        addressSlot: json["addressSlot"],
        days: json["days"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        quantitySlot: json["quantitySlot"].toInt(),
        fullName: json["fullName"],
        userImgUrl: json["userImgUrl"],
        highlightUrl: json["highlightUrl"],
        price: json["price"].toInt(),
      );

  Map<String, dynamic> toJson() => {
        "idPost": idPost,
        "title": title,
        "contentPost": contentPost,
        "imgUrlPost": imgUrlPost,
        "addressSlot": addressSlot,
        "days": days,
        "startTime": startTime,
        "endTime": endTime,
        "quantitySlot": quantitySlot,
        "fullName": fullName,
        "userImgUrl": userImgUrl,
        "highlightUrl": highlightUrl,
        "price": price,
      };
}
