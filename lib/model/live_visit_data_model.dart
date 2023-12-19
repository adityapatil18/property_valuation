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
  String wardname;
  List<Mmsheet> mmsheet;
  List<PhysicalInI> physicalInI;
  List<PhysicalInIi> physicalInIi;
  List<Imagesmap> imagesmap;
  String caseStatus;
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
  String propertyTypeName;

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
    required this.wardname,
    required this.mmsheet,
    required this.physicalInI,
    required this.physicalInIi,
    required this.imagesmap,
    required this.caseStatus,
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
    required this.propertyTypeName,
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
        wardname: json["wardname"],
        mmsheet:
            List<Mmsheet>.from(json["mmsheet"].map((x) => Mmsheet.fromJson(x))),
        physicalInI: List<PhysicalInI>.from(
            json["PhysicalInI"].map((x) => PhysicalInI.fromJson(x))),
        physicalInIi: List<PhysicalInIi>.from(
            json["PhysicalInII"].map((x) => PhysicalInIi.fromJson(x))),
        imagesmap: List<Imagesmap>.from(
            json["Imagesmap"].map((x) => Imagesmap.fromJson(x))),
        caseStatus: json["CaseStatus"],
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
        propertyTypeName: json["PropertyTypeName"],
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
        "wardname": wardname,
        "mmsheet": List<dynamic>.from(mmsheet.map((x) => x.toJson())),
        "PhysicalInI": List<dynamic>.from(physicalInI.map((x) => x.toJson())),
        "PhysicalInII": List<dynamic>.from(physicalInIi.map((x) => x.toJson())),
        "Imagesmap": List<dynamic>.from(imagesmap.map((x) => x.toJson())),
        "CaseStatus": caseStatus,
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
        "PropertyTypeName": propertyTypeName,
      };
}

class Imagesmap {
  double latitude;
  double longitude;
  String mapimage;
  String latitudedms;
  String longitudedms;
  List<Uploadimage> uploadimage;
  String drawimage;
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
  String image;
  String name;
  String sequence;

  Imagesmaplist({
    required this.image,
    required this.name,
    required this.sequence,
  });

  factory Imagesmaplist.fromJson(Map<String, dynamic> json) => Imagesmaplist(
        image: json["image"],
        name: json["name"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
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

class Mmsheet {
  List<dynamic> rows;
  String mmsheetType;
  int balconyTotal;
  int carpetAreaTotal;
  int otherAreaTotal;
  int refugeAreaTotal;
  int terraceAreaTotal;

  Mmsheet({
    required this.rows,
    required this.mmsheetType,
    required this.balconyTotal,
    required this.carpetAreaTotal,
    required this.otherAreaTotal,
    required this.refugeAreaTotal,
    required this.terraceAreaTotal,
  });

  factory Mmsheet.fromJson(Map<String, dynamic> json) => Mmsheet(
        rows: List<dynamic>.from(json["rows"].map((x) => x)),
        mmsheetType: json["mmsheetType"],
        balconyTotal: json["BalconyTotal"],
        carpetAreaTotal: json["CarpetAreaTotal"],
        otherAreaTotal: json["OtherAreaTotal"],
        refugeAreaTotal: json["RefugeAreaTotal"],
        terraceAreaTotal: json["TerraceAreaTotal"],
      );

  Map<String, dynamic> toJson() => {
        "rows": List<dynamic>.from(rows.map((x) => x)),
        "mmsheetType": mmsheetType,
        "BalconyTotal": balconyTotal,
        "CarpetAreaTotal": carpetAreaTotal,
        "OtherAreaTotal": otherAreaTotal,
        "RefugeAreaTotal": refugeAreaTotal,
        "TerraceAreaTotal": terraceAreaTotal,
      };
}

class PhysicalInI {
  String infrastructure;
  String distancefromLandmark;
  String distanceFromBank;
  String nameofNearestHospital;
  String conditionandwidthofapproachroad;
  String nameofNearestBusStop;
  String boundariesAsPerSite1;
  String boundariesAsPerDeed1;
  String dimensionAsPerSite1;
  String dimensionAsPerDeed1;
  String mosAsPerSite1;
  String mosAsPerDeed1;
  String boundariesAsPerSite2;
  String boundariesAsPerDeed2;
  String dimensionAsPerSite2;
  String dimensionAsPerDeed2;
  String mosAsPerSite2;
  String mosAsPerDeed2;
  String boundariesAsPerSite3;
  String boundariesAsPerDeed3;
  String dimensionAsPerSite3;
  String dimensionAsPerDeed3;
  String mosAsPerSite3;
  String mosAsPerDeed3;
  String boundariesAsPerSite4;
  String boundariesAsPerDeed4;
  String dimensionAsPerSite4;
  String dimensionAsPerDeed4;
  String mosAsPerSite4;
  String mosAsPerDeed4;
  String nameofPersonMetatSite;
  String contactofPersonMetatSite;
  String nameonsocietyboard;
  String nameofOccupan;
  String occupiedSince;
  String nameofReportedOwnerasperSiteInformation;
  String landHolding;
  String neighbourhoodGroup;
  String marketability;
  String property;
  String boundaries;
  String relationship;
  String localityConnectivity;
  String proximity;
  String zoneAsperCity;

  PhysicalInI({
    required this.infrastructure,
    required this.distancefromLandmark,
    required this.distanceFromBank,
    required this.nameofNearestHospital,
    required this.conditionandwidthofapproachroad,
    required this.nameofNearestBusStop,
    required this.boundariesAsPerSite1,
    required this.boundariesAsPerDeed1,
    required this.dimensionAsPerSite1,
    required this.dimensionAsPerDeed1,
    required this.mosAsPerSite1,
    required this.mosAsPerDeed1,
    required this.boundariesAsPerSite2,
    required this.boundariesAsPerDeed2,
    required this.dimensionAsPerSite2,
    required this.dimensionAsPerDeed2,
    required this.mosAsPerSite2,
    required this.mosAsPerDeed2,
    required this.boundariesAsPerSite3,
    required this.boundariesAsPerDeed3,
    required this.dimensionAsPerSite3,
    required this.dimensionAsPerDeed3,
    required this.mosAsPerSite3,
    required this.mosAsPerDeed3,
    required this.boundariesAsPerSite4,
    required this.boundariesAsPerDeed4,
    required this.dimensionAsPerSite4,
    required this.dimensionAsPerDeed4,
    required this.mosAsPerSite4,
    required this.mosAsPerDeed4,
    required this.nameofPersonMetatSite,
    required this.contactofPersonMetatSite,
    required this.nameonsocietyboard,
    required this.nameofOccupan,
    required this.occupiedSince,
    required this.nameofReportedOwnerasperSiteInformation,
    required this.landHolding,
    required this.neighbourhoodGroup,
    required this.marketability,
    required this.property,
    required this.boundaries,
    required this.relationship,
    required this.localityConnectivity,
    required this.proximity,
    required this.zoneAsperCity,
  });

  factory PhysicalInI.fromJson(Map<String, dynamic> json) => PhysicalInI(
        infrastructure: json["Infrastructure"],
        distancefromLandmark: json["DistancefromLandmark"],
        distanceFromBank: json["DistanceFromBank"],
        nameofNearestHospital: json["NameofNearestHospital"],
        conditionandwidthofapproachroad:
            json["Conditionandwidthofapproachroad"],
        nameofNearestBusStop: json["NameofNearestBusStop"],
        boundariesAsPerSite1: json["BOUNDARIES_AS_PER_SITE1"],
        boundariesAsPerDeed1: json["BOUNDARIES_AS_PER_DEED1"],
        dimensionAsPerSite1: json["DIMENSION_AS_PER_SITE1"],
        dimensionAsPerDeed1: json["DIMENSION_AS_PER_DEED1"],
        mosAsPerSite1: json["MOS_AS_PER_SITE1"],
        mosAsPerDeed1: json["MOS_AS_PER_DEED1"],
        boundariesAsPerSite2: json["BOUNDARIES_AS_PER_SITE2"],
        boundariesAsPerDeed2: json["BOUNDARIES_AS_PER_DEED2"],
        dimensionAsPerSite2: json["DIMENSION_AS_PER_SITE2"],
        dimensionAsPerDeed2: json["DIMENSION_AS_PER_DEED2"],
        mosAsPerSite2: json["MOS_AS_PER_SITE2"],
        mosAsPerDeed2: json["MOS_AS_PER_DEED2"],
        boundariesAsPerSite3: json["BOUNDARIES_AS_PER_SITE3"],
        boundariesAsPerDeed3: json["BOUNDARIES_AS_PER_DEED3"],
        dimensionAsPerSite3: json["DIMENSION_AS_PER_SITE3"],
        dimensionAsPerDeed3: json["DIMENSION_AS_PER_DEED3"],
        mosAsPerSite3: json["MOS_AS_PER_SITE3"],
        mosAsPerDeed3: json["MOS_AS_PER_DEED3"],
        boundariesAsPerSite4: json["BOUNDARIES_AS_PER_SITE4"],
        boundariesAsPerDeed4: json["BOUNDARIES_AS_PER_DEED4"],
        dimensionAsPerSite4: json["DIMENSION_AS_PER_SITE4"],
        dimensionAsPerDeed4: json["DIMENSION_AS_PER_DEED4"],
        mosAsPerSite4: json["MOS_AS_PER_SITE4"],
        mosAsPerDeed4: json["MOS_AS_PER_DEED4"],
        nameofPersonMetatSite: json["NameofPersonMetatSite"],
        contactofPersonMetatSite: json["ContactofPersonMetatSite"],
        nameonsocietyboard: json["Nameonsocietyboard"],
        nameofOccupan: json["NameofOccupan"],
        occupiedSince: json["OccupiedSince"],
        nameofReportedOwnerasperSiteInformation:
            json["NameofReportedOwnerasperSiteInformation"],
        landHolding: json["LandHolding"],
        neighbourhoodGroup: json["NeighbourhoodGroup"],
        marketability: json["Marketability"],
        property: json["Property"],
        boundaries: json["Boundaries"],
        relationship: json["Relationship"],
        localityConnectivity: json["LocalityConnectivity"],
        proximity: json["Proximity"],
        zoneAsperCity: json["ZoneAsperCity"],
      );

  Map<String, dynamic> toJson() => {
        "Infrastructure": infrastructure,
        "DistancefromLandmark": distancefromLandmark,
        "DistanceFromBank": distanceFromBank,
        "NameofNearestHospital": nameofNearestHospital,
        "Conditionandwidthofapproachroad": conditionandwidthofapproachroad,
        "NameofNearestBusStop": nameofNearestBusStop,
        "BOUNDARIES_AS_PER_SITE1": boundariesAsPerSite1,
        "BOUNDARIES_AS_PER_DEED1": boundariesAsPerDeed1,
        "DIMENSION_AS_PER_SITE1": dimensionAsPerSite1,
        "DIMENSION_AS_PER_DEED1": dimensionAsPerDeed1,
        "MOS_AS_PER_SITE1": mosAsPerSite1,
        "MOS_AS_PER_DEED1": mosAsPerDeed1,
        "BOUNDARIES_AS_PER_SITE2": boundariesAsPerSite2,
        "BOUNDARIES_AS_PER_DEED2": boundariesAsPerDeed2,
        "DIMENSION_AS_PER_SITE2": dimensionAsPerSite2,
        "DIMENSION_AS_PER_DEED2": dimensionAsPerDeed2,
        "MOS_AS_PER_SITE2": mosAsPerSite2,
        "MOS_AS_PER_DEED2": mosAsPerDeed2,
        "BOUNDARIES_AS_PER_SITE3": boundariesAsPerSite3,
        "BOUNDARIES_AS_PER_DEED3": boundariesAsPerDeed3,
        "DIMENSION_AS_PER_SITE3": dimensionAsPerSite3,
        "DIMENSION_AS_PER_DEED3": dimensionAsPerDeed3,
        "MOS_AS_PER_SITE3": mosAsPerSite3,
        "MOS_AS_PER_DEED3": mosAsPerDeed3,
        "BOUNDARIES_AS_PER_SITE4": boundariesAsPerSite4,
        "BOUNDARIES_AS_PER_DEED4": boundariesAsPerDeed4,
        "DIMENSION_AS_PER_SITE4": dimensionAsPerSite4,
        "DIMENSION_AS_PER_DEED4": dimensionAsPerDeed4,
        "MOS_AS_PER_SITE4": mosAsPerSite4,
        "MOS_AS_PER_DEED4": mosAsPerDeed4,
        "NameofPersonMetatSite": nameofPersonMetatSite,
        "ContactofPersonMetatSite": contactofPersonMetatSite,
        "Nameonsocietyboard": nameonsocietyboard,
        "NameofOccupan": nameofOccupan,
        "OccupiedSince": occupiedSince,
        "NameofReportedOwnerasperSiteInformation":
            nameofReportedOwnerasperSiteInformation,
        "LandHolding": landHolding,
        "NeighbourhoodGroup": neighbourhoodGroup,
        "Marketability": marketability,
        "Property": property,
        "Boundaries": boundaries,
        "Relationship": relationship,
        "LocalityConnectivity": localityConnectivity,
        "Proximity": proximity,
        "ZoneAsperCity": zoneAsperCity,
      };
}

class PhysicalInIi {
  String percentageOfConstruction;
  String floorNoincaseofIndependentUnit;
  String noofUnitsperFloorAndPositionofUnits;
  String accommodationOfFlat;
  String noOfStoreys;
  String propertyAge;
  String residualAge;
  String occupancyStatus;
  String engineerRemarks;
  dynamic stageOfConstruction;
  dynamic detailText;
  String typeOfProperty;
  String usage;
  String constructionAsPerPlan;
  dynamic violation;
  String commercialUsage;
  String remarksonview;
  dynamic constructionType;
  String lifts;
  String exterior;
  String interior;
  dynamic flooring;
  String fittings;
  String door;
  String window;
  String maintenance;
  dynamic amenitiesAvailableInSociety;
  List<DetailsOfConstruction> detailsOfConstruction;
  String physicalStatus;

  PhysicalInIi({
    required this.percentageOfConstruction,
    required this.floorNoincaseofIndependentUnit,
    required this.noofUnitsperFloorAndPositionofUnits,
    required this.accommodationOfFlat,
    required this.noOfStoreys,
    required this.propertyAge,
    required this.residualAge,
    required this.occupancyStatus,
    required this.engineerRemarks,
    required this.stageOfConstruction,
    required this.detailText,
    required this.typeOfProperty,
    required this.usage,
    required this.constructionAsPerPlan,
    required this.violation,
    required this.commercialUsage,
    required this.remarksonview,
    required this.constructionType,
    required this.lifts,
    required this.exterior,
    required this.interior,
    required this.flooring,
    required this.fittings,
    required this.door,
    required this.window,
    required this.maintenance,
    required this.amenitiesAvailableInSociety,
    required this.detailsOfConstruction,
    required this.physicalStatus,
  });

  factory PhysicalInIi.fromJson(Map<String, dynamic> json) => PhysicalInIi(
        percentageOfConstruction: json["PercentageOfConstruction"],
        floorNoincaseofIndependentUnit: json["FloorNoincaseofIndependentUnit"],
        noofUnitsperFloorAndPositionofUnits:
            json["NoofUnitsperFloorAndPositionofUnits"],
        accommodationOfFlat: json["AccommodationOfFlat"],
        noOfStoreys: json["NoOfStoreys"],
        propertyAge: json["PropertyAge"],
        residualAge: json["ResidualAge"],
        occupancyStatus: json["OccupancyStatus"],
        engineerRemarks: json["EngineerRemarks"],
        stageOfConstruction: json["StageOfConstruction"],
        detailText: json["Detail_Text"],
        typeOfProperty: json["TypeOfProperty"],
        usage: json["Usage"],
        constructionAsPerPlan: json["ConstructionAsPerPlan"],
        violation: json["Violation"],
        commercialUsage: json["CommercialUsage"],
        remarksonview: json["Remarksonview"],
        constructionType: json["ConstructionType"],
        lifts: json["Lifts"],
        exterior: json["Exterior"],
        interior: json["Interior"],
        flooring: json["Flooring"],
        fittings: json["Fittings"],
        door: json["Door"],
        window: json["Window"],
        maintenance: json["Maintenance"],
        amenitiesAvailableInSociety: json["AmenitiesAvailableInSociety"],
        detailsOfConstruction: List<DetailsOfConstruction>.from(
            json["Details_of_Construction"]
                .map((x) => DetailsOfConstruction.fromJson(x))),
        physicalStatus: json["PhysicalStatus"],
      );

  Map<String, dynamic> toJson() => {
        "PercentageOfConstruction": percentageOfConstruction,
        "FloorNoincaseofIndependentUnit": floorNoincaseofIndependentUnit,
        "NoofUnitsperFloorAndPositionofUnits":
            noofUnitsperFloorAndPositionofUnits,
        "AccommodationOfFlat": accommodationOfFlat,
        "NoOfStoreys": noOfStoreys,
        "PropertyAge": propertyAge,
        "ResidualAge": residualAge,
        "OccupancyStatus": occupancyStatus,
        "EngineerRemarks": engineerRemarks,
        "StageOfConstruction": stageOfConstruction,
        "Detail_Text": detailText,
        "TypeOfProperty": typeOfProperty,
        "Usage": usage,
        "ConstructionAsPerPlan": constructionAsPerPlan,
        "Violation": violation,
        "CommercialUsage": commercialUsage,
        "Remarksonview": remarksonview,
        "ConstructionType": constructionType,
        "Lifts": lifts,
        "Exterior": exterior,
        "Interior": interior,
        "Flooring": flooring,
        "Fittings": fittings,
        "Door": door,
        "Window": window,
        "Maintenance": maintenance,
        "AmenitiesAvailableInSociety": amenitiesAvailableInSociety,
        "Details_of_Construction":
            List<dynamic>.from(detailsOfConstruction.map((x) => x.toJson())),
        "PhysicalStatus": physicalStatus,
      };
}

class DetailsOfConstruction {
  String footingExcavation;
  String plinth;
  dynamic slabsCompleted;
  dynamic slabsTotal;
  dynamic externalBrickworkCompleted;
  dynamic externalBrickworkTotal;
  dynamic internalBrickwork;
  dynamic internalPlaster;
  dynamic externalPlaster;
  dynamic flooring;
  dynamic gypsum;
  dynamic plumbing;
  String liftInstallation;
  dynamic dateOfVisit1;
  dynamic dateOfVisit1Per;
  dynamic dateOfVisit2;
  dynamic dateOfVisit2Per;
  dynamic dateOfVisit3;
  dynamic dateOfVisit3Per;
  dynamic dateOfVisit4;
  dynamic dateOfVisit4Per;
  dynamic dateOfVisit5;
  dynamic dateOfVisit5Per;
  dynamic dateOfVisit6;
  dynamic dateOfVisit6Per;

  DetailsOfConstruction({
    required this.footingExcavation,
    required this.plinth,
    required this.slabsCompleted,
    required this.slabsTotal,
    required this.externalBrickworkCompleted,
    required this.externalBrickworkTotal,
    required this.internalBrickwork,
    required this.internalPlaster,
    required this.externalPlaster,
    required this.flooring,
    required this.gypsum,
    required this.plumbing,
    required this.liftInstallation,
    required this.dateOfVisit1,
    required this.dateOfVisit1Per,
    required this.dateOfVisit2,
    required this.dateOfVisit2Per,
    required this.dateOfVisit3,
    required this.dateOfVisit3Per,
    required this.dateOfVisit4,
    required this.dateOfVisit4Per,
    required this.dateOfVisit5,
    required this.dateOfVisit5Per,
    required this.dateOfVisit6,
    required this.dateOfVisit6Per,
  });

  factory DetailsOfConstruction.fromJson(Map<String, dynamic> json) =>
      DetailsOfConstruction(
        footingExcavation: json["FootingExcavation"],
        plinth: json["Plinth"],
        slabsCompleted: json["Slabs_Completed"],
        slabsTotal: json["Slabs_Total"],
        externalBrickworkCompleted: json["ExternalBrickwork_Completed"],
        externalBrickworkTotal: json["ExternalBrickwork_Total"],
        internalBrickwork: json["InternalBrickwork"],
        internalPlaster: json["InternalPlaster"],
        externalPlaster: json["ExternalPlaster"],
        flooring: json["Flooring"],
        gypsum: json["Gypsum"],
        plumbing: json["Plumbing"],
        liftInstallation: json["LiftInstallation"],
        dateOfVisit1: json["date_of_visit1"],
        dateOfVisit1Per: json["date_of_visit1_per"],
        dateOfVisit2: json["date_of_visit2"],
        dateOfVisit2Per: json["date_of_visit2_per"],
        dateOfVisit3: json["date_of_visit3"],
        dateOfVisit3Per: json["date_of_visit3_per"],
        dateOfVisit4: json["date_of_visit4"],
        dateOfVisit4Per: json["date_of_visit4_per"],
        dateOfVisit5: json["date_of_visit5"],
        dateOfVisit5Per: json["date_of_visit5_per"],
        dateOfVisit6: json["date_of_visit6"],
        dateOfVisit6Per: json["date_of_visit6_per"],
      );

  Map<String, dynamic> toJson() => {
        "FootingExcavation": footingExcavation,
        "Plinth": plinth,
        "Slabs_Completed": slabsCompleted,
        "Slabs_Total": slabsTotal,
        "ExternalBrickwork_Completed": externalBrickworkCompleted,
        "ExternalBrickwork_Total": externalBrickworkTotal,
        "InternalBrickwork": internalBrickwork,
        "InternalPlaster": internalPlaster,
        "ExternalPlaster": externalPlaster,
        "Flooring": flooring,
        "Gypsum": gypsum,
        "Plumbing": plumbing,
        "LiftInstallation": liftInstallation,
        "date_of_visit1": dateOfVisit1,
        "date_of_visit1_per": dateOfVisit1Per,
        "date_of_visit2": dateOfVisit2,
        "date_of_visit2_per": dateOfVisit2Per,
        "date_of_visit3": dateOfVisit3,
        "date_of_visit3_per": dateOfVisit3Per,
        "date_of_visit4": dateOfVisit4,
        "date_of_visit4_per": dateOfVisit4Per,
        "date_of_visit5": dateOfVisit5,
        "date_of_visit5_per": dateOfVisit5Per,
        "date_of_visit6": dateOfVisit6,
        "date_of_visit6_per": dateOfVisit6Per,
      };
}
