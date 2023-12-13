// To parse this JSON data, do
//
//     final liveVisitData = liveVisitDataFromJson(jsonString);

import 'dart:convert';

LiveVisitData liveVisitDataFromJson(String str) =>
    LiveVisitData.fromJson(json.decode(str));

String liveVisitDataToJson(LiveVisitData data) => json.encode(data.toJson());

class LiveVisitData {
  int status;
  String message;
  Data data;

  LiveVisitData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LiveVisitData.fromJson(Map<String, dynamic> json) => LiveVisitData(
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
  String id;
  String appId;
  String priorityFlag;
  String institutionType;
  String institutionName;
  DateTime requestDate;
  DateTime visitScheduledDate;
  String filerefNo;
  String casNo;
  String borrowerName;
  String contactPersonName;
  String mobileNo1;
  String landlineNumber1;
  String mobileNo2;
  String landlineNumber2;
  String mobileNo3;
  String loanType;
  String addressofProperty;
  String flatUnitNo;
  String floorwing;
  String societyName;
  String plotNo;
  String roadArea;
  String sector;
  String city;
  String location;
  String landmark;
  String district;
  String ctsSurveyNo;
  String pin;
  String splInstruction;
  String visitAllocated;
  String status;
  bool hold;
  String userId;
  String createdBy;
  String reportformat;
  String reportformatId;
  String reportStatusBy;
  String addressofPropertyValued;
  List<dynamic> mmsheet;
  List<dynamic> physicalInI;
  List<dynamic> physicalInIi;
  List<Imagesmap> imagesmap;
  String reportcheckerId;
  String businesscordinatorId;
  String principalvaluerId;
  String visitstatus;
  String lastvisitupdatedById;
  List<dynamic> ndmaParameter;
  List<dynamic> valuationlist;
  List<dynamic> finalizationlist;
  List<dynamic> documentslist;
  DateTime updatedAt;
  String manageInstitutename;
  String maininstitutionname;
  String branchname;
  String username;
  String fees;
  String visitAllocatedname;
  String loanName;
  String locationName;
  String makerName;

  Data({
    required this.id,
    required this.appId,
    required this.priorityFlag,
    required this.institutionType,
    required this.institutionName,
    required this.requestDate,
    required this.visitScheduledDate,
    required this.filerefNo,
    required this.casNo,
    required this.borrowerName,
    required this.contactPersonName,
    required this.mobileNo1,
    required this.landlineNumber1,
    required this.mobileNo2,
    required this.landlineNumber2,
    required this.mobileNo3,
    required this.loanType,
    required this.addressofProperty,
    required this.flatUnitNo,
    required this.floorwing,
    required this.societyName,
    required this.plotNo,
    required this.roadArea,
    required this.sector,
    required this.city,
    required this.location,
    required this.landmark,
    required this.district,
    required this.ctsSurveyNo,
    required this.pin,
    required this.splInstruction,
    required this.visitAllocated,
    required this.status,
    required this.hold,
    required this.userId,
    required this.createdBy,
    required this.reportformat,
    required this.reportformatId,
    required this.reportStatusBy,
    required this.addressofPropertyValued,
    required this.mmsheet,
    required this.physicalInI,
    required this.physicalInIi,
    required this.imagesmap,
    required this.reportcheckerId,
    required this.businesscordinatorId,
    required this.principalvaluerId,
    required this.visitstatus,
    required this.lastvisitupdatedById,
    required this.ndmaParameter,
    required this.valuationlist,
    required this.finalizationlist,
    required this.documentslist,
    required this.updatedAt,
    required this.manageInstitutename,
    required this.maininstitutionname,
    required this.branchname,
    required this.username,
    required this.fees,
    required this.visitAllocatedname,
    required this.loanName,
    required this.locationName,
    required this.makerName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        appId: json["appId"],
        priorityFlag: json["priorityFlag"],
        institutionType: json["institutionType"],
        institutionName: json["institutionName"],
        requestDate: DateTime.parse(json["requestDate"]),
        visitScheduledDate: DateTime.parse(json["visitScheduledDate"]),
        filerefNo: json["filerefNo"],
        casNo: json["CASNo"],
        borrowerName: json["borrowerName"],
        contactPersonName: json["contactPersonName"],
        mobileNo1: json["mobileNo1"],
        landlineNumber1: json["landlineNumber1"],
        mobileNo2: json["mobileNo2"],
        landlineNumber2: json["landlineNumber2"],
        mobileNo3: json["mobileNo3"],
        loanType: json["loanType"],
        addressofProperty: json["addressofProperty"],
        flatUnitNo: json["flatUnitNo"],
        floorwing: json["floorwing"],
        societyName: json["societyName"],
        plotNo: json["plotNo"],
        roadArea: json["roadArea"],
        sector: json["sector"],
        city: json["city"],
        location: json["location"],
        landmark: json["landmark"],
        district: json["district"],
        ctsSurveyNo: json["CTSSurveyNo"],
        pin: json["pin"],
        splInstruction: json["splInstruction"],
        visitAllocated: json["visitAllocated"],
        status: json["status"],
        hold: json["hold"],
        userId: json["userID"],
        createdBy: json["CreatedBy"],
        reportformat: json["reportformat"],
        reportformatId: json["reportformatId"],
        reportStatusBy: json["report_status_by"],
        addressofPropertyValued: json["addressofPropertyValued"],
        mmsheet: List<dynamic>.from(json["mmsheet"].map((x) => x)),
        physicalInI: List<dynamic>.from(json["PhysicalInI"].map((x) => x)),
        physicalInIi: List<dynamic>.from(json["PhysicalInII"].map((x) => x)),
        imagesmap: List<Imagesmap>.from(
            json["Imagesmap"].map((x) => Imagesmap.fromJson(x))),
        reportcheckerId: json["reportcheckerId"],
        businesscordinatorId: json["businesscordinatorId"],
        principalvaluerId: json["principalvaluerId"],
        visitstatus: json["visitstatus"],
        lastvisitupdatedById: json["lastvisitupdatedById"],
        ndmaParameter: List<dynamic>.from(json["NDMAParameter"].map((x) => x)),
        valuationlist: List<dynamic>.from(json["Valuationlist"].map((x) => x)),
        finalizationlist:
            List<dynamic>.from(json["Finalizationlist"].map((x) => x)),
        documentslist: List<dynamic>.from(json["Documentslist"].map((x) => x)),
        updatedAt: DateTime.parse(json["updatedAt"]),
        manageInstitutename: json["ManageInstitutename"],
        maininstitutionname: json["maininstitutionname"],
        branchname: json["Branchname"],
        username: json["username"],
        fees: json["Fees"],
        visitAllocatedname: json["visitAllocatedname"],
        loanName: json["loanName"],
        locationName: json["locationName"],
        makerName: json["MakerName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "appId": appId,
        "priorityFlag": priorityFlag,
        "institutionType": institutionType,
        "institutionName": institutionName,
        "requestDate":
            "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
        "visitScheduledDate":
            "${visitScheduledDate.year.toString().padLeft(4, '0')}-${visitScheduledDate.month.toString().padLeft(2, '0')}-${visitScheduledDate.day.toString().padLeft(2, '0')}",
        "filerefNo": filerefNo,
        "CASNo": casNo,
        "borrowerName": borrowerName,
        "contactPersonName": contactPersonName,
        "mobileNo1": mobileNo1,
        "landlineNumber1": landlineNumber1,
        "mobileNo2": mobileNo2,
        "landlineNumber2": landlineNumber2,
        "mobileNo3": mobileNo3,
        "loanType": loanType,
        "addressofProperty": addressofProperty,
        "flatUnitNo": flatUnitNo,
        "floorwing": floorwing,
        "societyName": societyName,
        "plotNo": plotNo,
        "roadArea": roadArea,
        "sector": sector,
        "city": city,
        "location": location,
        "landmark": landmark,
        "district": district,
        "CTSSurveyNo": ctsSurveyNo,
        "pin": pin,
        "splInstruction": splInstruction,
        "visitAllocated": visitAllocated,
        "status": status,
        "hold": hold,
        "userID": userId,
        "CreatedBy": createdBy,
        "reportformat": reportformat,
        "reportformatId": reportformatId,
        "report_status_by": reportStatusBy,
        "addressofPropertyValued": addressofPropertyValued,
        "mmsheet": List<dynamic>.from(mmsheet.map((x) => x)),
        "PhysicalInI": List<dynamic>.from(physicalInI.map((x) => x)),
        "PhysicalInII": List<dynamic>.from(physicalInIi.map((x) => x)),
        "Imagesmap": List<dynamic>.from(imagesmap.map((x) => x.toJson())),
        "reportcheckerId": reportcheckerId,
        "businesscordinatorId": businesscordinatorId,
        "principalvaluerId": principalvaluerId,
        "visitstatus": visitstatus,
        "lastvisitupdatedById": lastvisitupdatedById,
        "NDMAParameter": List<dynamic>.from(ndmaParameter.map((x) => x)),
        "Valuationlist": List<dynamic>.from(valuationlist.map((x) => x)),
        "Finalizationlist": List<dynamic>.from(finalizationlist.map((x) => x)),
        "Documentslist": List<dynamic>.from(documentslist.map((x) => x)),
        "updatedAt": updatedAt.toIso8601String(),
        "ManageInstitutename": manageInstitutename,
        "maininstitutionname": maininstitutionname,
        "Branchname": branchname,
        "username": username,
        "Fees": fees,
        "visitAllocatedname": visitAllocatedname,
        "loanName": loanName,
        "locationName": locationName,
        "MakerName": makerName,
      };
}

class Imagesmap {
  double latitude;
  double longitude;
  String mapimage;
  String latitudedms;
  String longitudedms;
  List<Uploadimage> uploadimage;
  dynamic drawimage;
  List<Imagesmaplist> imagesmaplist;

  Imagesmap({
    required this.latitude,
    required this.longitude,
    required this.mapimage,
    required this.latitudedms,
    required this.longitudedms,
    required this.uploadimage,
    required this.drawimage,
    required this.imagesmaplist,
  });

  factory Imagesmap.fromJson(Map<String, dynamic> json) => Imagesmap(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        mapimage: json["mapimage"],
        latitudedms: json["latitudedms"],
        longitudedms: json["longitudedms"],
        uploadimage: List<Uploadimage>.from(
            json["uploadimage"].map((x) => Uploadimage.fromJson(x))),
        drawimage: json["drawimage"],
        imagesmaplist: List<Imagesmaplist>.from(
            json["Imagesmaplist"].map((x) => Imagesmaplist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "mapimage": mapimage,
        "latitudedms": latitudedms,
        "longitudedms": longitudedms,
        "uploadimage": List<dynamic>.from(uploadimage.map((x) => x.toJson())),
        "drawimage": drawimage,
        "Imagesmaplist":
            List<dynamic>.from(imagesmaplist.map((x) => x.toJson())),
      };
}

class Imagesmaplist {
  List<String> image;
  String name;
  String sequence;

  Imagesmaplist({
    required this.image,
    required this.name,
    required this.sequence,
  });

  factory Imagesmaplist.fromJson(Map<String, dynamic> json) => Imagesmaplist(
        image: List<String>.from(json["image"].map((x) => x)),
        name: json["name"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image.map((x) => x)),
        "name": name,
        "sequence": sequence,
      };
}

class Uploadimage {
  String name;

  Uploadimage({
    required this.name,
  });

  factory Uploadimage.fromJson(Map<String, dynamic> json) => Uploadimage(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
