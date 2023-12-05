// To parse this JSON data, do
//
//     final loanType = loanTypeFromJson(jsonString);

import 'dart:convert';

LoanType loanTypeFromJson(String str) => LoanType.fromJson(json.decode(str));

String loanTypeToJson(LoanType data) => json.encode(data.toJson());

class LoanType {
  int status;
  String message;
  List<LoanTypeData> data;

  LoanType({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoanType.fromJson(Map<String, dynamic> json) => LoanType(
        status: json["status"],
        message: json["message"],
        data: List<LoanTypeData>.from(
            json["data"].map((x) => LoanTypeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LoanTypeData {
  String id;
  String name;
  String userId;
  String createdBy;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  LoanTypeData({
    required this.id,
    required this.name,
    required this.userId,
    required this.createdBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory LoanTypeData.fromJson(Map<String, dynamic> json) => LoanTypeData(
        id: json["_id"],
        name: json["name"],
        userId: json["userID"],
        createdBy: json["CreatedBy"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "userID": userId,
        "CreatedBy": createdBy,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
