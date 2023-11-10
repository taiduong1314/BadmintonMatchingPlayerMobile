// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  String? message;
  List<CommentDataModel>? data;

  CommentModel({
    this.message,
    this.data,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    message: json["message"],
    data: List<CommentDataModel>.from(json["data"].map((x) => CommentDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CommentDataModel {
  int? userId;
  String? userName;
  String? content;
  String? userAvatar;
  double? totalRate;
  String? savedDate;

  CommentDataModel({
    this.userId,
    this.userName,
    this.content,
    this.userAvatar,
    this.totalRate,
    this.savedDate,
  });

  factory CommentDataModel.fromJson(Map<String, dynamic> json) => CommentDataModel(
    userId: json["userId"],
    userName: json["userName"],
    content: json["content"],
    userAvatar: json["userAvatar"],
    totalRate: json["totalRate"]?.toDouble(),
    savedDate: json["savedDate"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userName": userName,
    "content": content,
    "userAvatar": userAvatar,
    "totalRate": totalRate,
    "savedDate": savedDate,
  };
}
