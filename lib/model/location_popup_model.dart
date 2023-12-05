// To parse this JSON data, do
//
//     final locationPopUpList = locationPopUpListFromJson(jsonString);

import 'dart:convert';


LocationPopUpList locationPopUpListFromJson(String str) => LocationPopUpList.fromJson(json.decode(str));

String locationPopUpListToJson(LocationPopUpList data) => json.encode(data.toJson());

class LocationPopUpList {
    int status;
    String message;
    List<LocationListData> data;

    LocationPopUpList({
        required this.status,
        required this.message,
        required this.data,
    });

    factory LocationPopUpList.fromJson(Map<String, dynamic> json) => LocationPopUpList(
        status: json["status"],
        message: json["message"],
        data: List<LocationListData>.from(json["data"].map((x) => LocationListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class LocationListData {
    String id;
    String pincode;
    String locationcode;
    String region;
    String name;
    String status;
    String userId;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    LocationListData({
        required this.id,
        required this.pincode,
        required this.locationcode,
        required this.region,
        required this.name,
        required this.status,
        required this.userId,
        required this.createdBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory LocationListData.fromJson(Map<String, dynamic> json) => LocationListData(
        id: json["_id"],
        pincode: json["pincode"],
        locationcode: json["locationcode"],
        region: json["region"],
        name: json["name"],
        status: json["status"],
        userId: json["userID"],
        createdBy: json["CreatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "pincode": pincode,
        "locationcode": locationcode,
        "region": region,
        "name": name,
        "status": status,
        "userID": userId,
        "CreatedBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
