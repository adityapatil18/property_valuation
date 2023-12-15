// To parse this JSON data, do
//
//     final propertyPopUpList = propertyPopUpListFromJson(jsonString);

import 'dart:convert';

class PropertyListData {
  String id;
  String name;
  String userID;
  String createdBy;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  PropertyListData({
    required this.id,
    required this.name,
    required this.userID,
    required this.createdBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PropertyListData.fromJson(Map<String, dynamic> json) {
    return PropertyListData(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      userID: json['userID'] ?? '',
      createdBy: json['CreatedBy'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
    );
  }
}

class PropertyPouUpList {
  int status;
  String message;
  List<PropertyListData> data;

  PropertyPouUpList({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PropertyPouUpList.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List<dynamic>;
    List<PropertyListData> propertyDataList =
        dataList.map((item) => PropertyListData.fromJson(item)).toList();

    return PropertyPouUpList(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: propertyDataList,
    );
  }
}
