// To parse this JSON data, do
//
//     final monthlyAllocData = monthlyAllocDataFromJson(jsonString);

import 'dart:convert';

MonthlyAllocData monthlyAllocDataFromJson(String str) =>
    MonthlyAllocData.fromJson(json.decode(str));

String monthlyAllocDataToJson(MonthlyAllocData data) =>
    json.encode(data.toJson());

class MonthlyAllocData {
  int status;
  String message;
  int count;

  MonthlyAllocData({
    required this.status,
    required this.message,
    required this.count,
  });

  factory MonthlyAllocData.fromJson(Map<String, dynamic> json) =>
      MonthlyAllocData(
        status: json["status"],
        message: json["message"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
      };
}
