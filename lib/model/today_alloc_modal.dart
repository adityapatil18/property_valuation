// To parse this JSON data, do
//
//     final todayAllocData = todayAllocDataFromJson(jsonString);

import 'dart:convert';

TodayAllocData todayAllocDataFromJson(String str) => TodayAllocData.fromJson(json.decode(str));

String todayAllocDataToJson(TodayAllocData data) => json.encode(data.toJson());

class TodayAllocData {
    int status;
    String message;
    int count;

    TodayAllocData({
        required this.status,
        required this.message,
        required this.count,
    });

    factory TodayAllocData.fromJson(Map<String, dynamic> json) => TodayAllocData(
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
