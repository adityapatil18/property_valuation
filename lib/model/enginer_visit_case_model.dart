// To parse this JSON data, do
//
//     final enginerVisitCaseData = enginerVisitCaseDataFromJson(jsonString);

import 'dart:convert';

EnginerVisitCaseData enginerVisitCaseDataFromJson(String str) =>
    EnginerVisitCaseData.fromJson(json.decode(str));

String enginerVisitCaseDataToJson(EnginerVisitCaseData data) =>
    json.encode(data.toJson());

class EnginerVisitCaseData {
  int status;
  String message;
  Data data;

  EnginerVisitCaseData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EnginerVisitCaseData.fromJson(Map<String, dynamic> json) =>
      EnginerVisitCaseData(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Dataarray> dataarray;
  int count;

  Data({
    required this.dataarray,
    required this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataarray: List<Dataarray>.from(
            json["dataarray"].map((x) => Dataarray.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "dataarray": List<dynamic>.from(dataarray.map((x) => x.toJson())),
        "count": count,
      };
}

class Dataarray {
  String id;
  DateTime requestDate;
  String appId;
  DateTime visitScheduledDate;
  String borrowerName;
  String mobileNo1;
  String addressofProperty;
  String status;
  String reportcheckerId;
  String businesscordinatorId;
  String principalvaluerId;
  String visitstatus;
  String reportStatusBy;
  String? splInstruction;
  List<ManageInstitute> manageInstitute;
  List<UserDatum> userData;
  List<LoanData> loanData;
  List<LocationData> locationData;

  Dataarray({
    required this.id,
    required this.requestDate,
    required this.appId,
    required this.visitScheduledDate,
    required this.borrowerName,
    required this.mobileNo1,
    required this.addressofProperty,
    required this.status,
    required this.reportcheckerId,
    required this.businesscordinatorId,
    required this.principalvaluerId,
    required this.visitstatus,
    required this.reportStatusBy,
    required this.splInstruction,
    required this.manageInstitute,
    required this.userData,
    required this.loanData,
    required this.locationData,
  });

  factory Dataarray.fromJson(Map<String, dynamic> json) => Dataarray(
        id: json["_id"],
        requestDate: DateTime.parse(json["requestDate"]),
        appId: json["appId"],
        visitScheduledDate: DateTime.parse(json["visitScheduledDate"]),
        borrowerName: json["borrowerName"],
        mobileNo1: json["mobileNo1"],
        addressofProperty: json["addressofProperty"],
        status: json["status"],
        reportcheckerId: json["reportcheckerId"],
        businesscordinatorId: json["businesscordinatorId"],
        principalvaluerId: json["principalvaluerId"],
        visitstatus: json["visitstatus"],
        reportStatusBy: json["report_status_by"],
        splInstruction: json["splInstruction"],
        manageInstitute: List<ManageInstitute>.from(
            json["ManageInstitute"].map((x) => ManageInstitute.fromJson(x))),
        userData: List<UserDatum>.from(
            json["userData"].map((x) => UserDatum.fromJson(x))),
        loanData: List<LoanData>.from(
            json["loanData"].map((x) => LoanData.fromJson(x))),
        locationData: List<LocationData>.from(
            json["LocationData"].map((x) => LocationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "requestDate":
            "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
        "appId": appId,
        "visitScheduledDate":
            "${visitScheduledDate.year.toString().padLeft(4, '0')}-${visitScheduledDate.month.toString().padLeft(2, '0')}-${visitScheduledDate.day.toString().padLeft(2, '0')}",
        "borrowerName": borrowerName,
        "mobileNo1": mobileNo1,
        "addressofProperty": addressofProperty,
        "status": status,
        "reportcheckerId": reportcheckerId,
        "businesscordinatorId": businesscordinatorId,
        "principalvaluerId": principalvaluerId,
        "visitstatus": visitstatus,
        "report_status_by": reportStatusBy,
        "splInstruction": splInstruction,
        "ManageInstitute":
            List<dynamic>.from(manageInstitute.map((x) => x.toJson())),
        "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
        "loanData": List<dynamic>.from(loanData.map((x) => x.toJson())),
        "LocationData": List<dynamic>.from(locationData.map((x) => x.toJson())),
      };
}

class LoanData {
  String id;
  String name;

  LoanData({
    required this.id,
    required this.name,
  });

  factory LoanData.fromJson(Map<String, dynamic> json) => LoanData(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class LocationData {
  String id;
  String name;

  LocationData({
    required this.id,
    required this.name,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class ManageInstitute {
  String manageInstituteId;
  String branch;
  String id;
  List<LoanData> maininstitutiondata;

  ManageInstitute({
    required this.manageInstituteId,
    required this.branch,
    required this.id,
    required this.maininstitutiondata,
  });

  factory ManageInstitute.fromJson(Map<String, dynamic> json) =>
      ManageInstitute(
        manageInstituteId: json["_id"],
        branch: json["branch"],
        id: json["ID"],
        maininstitutiondata: List<LoanData>.from(
            json["maininstitutiondata"].map((x) => LoanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": manageInstituteId,
        "branch": branch,
        "ID": id,
        "maininstitutiondata":
            List<dynamic>.from(maininstitutiondata.map((x) => x.toJson())),
      };
}

class Maininstitutiondata {
  String id;
  String name;

  Maininstitutiondata({
    required this.id,
    required this.name,
  });
  factory Maininstitutiondata.fromJson(Map<String, dynamic> json) =>
      Maininstitutiondata(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class UserDatum {
  String id;
  String firstname;
  String lastname;

  UserDatum({
    required this.id,
    required this.firstname,
    required this.lastname,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
      };
}
