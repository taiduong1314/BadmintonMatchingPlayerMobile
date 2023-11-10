import 'dart:convert';

List<DayOfWeekModel> dayOfWeekModelFromJson(String str) => List<DayOfWeekModel>.from(json.decode(str).map((x) => DayOfWeekModel.fromJson(x)));

String dayOfWeekModelToJson(List<DayOfWeekModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DayOfWeekModel {
  String? date;
  int? slot;

  DayOfWeekModel({
    this.date,
    this.slot,
  });

  factory DayOfWeekModel.fromJson(Map<String, dynamic> json) => DayOfWeekModel(
    date: json["date"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "slot": slot,
  };
}
