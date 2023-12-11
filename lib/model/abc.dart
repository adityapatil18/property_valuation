class PhysicalInspectionData {
  String distanceFromLandmark;

  PhysicalInspectionData({required this.distanceFromLandmark});

  Map<String, dynamic> toJson() {
    return {
      'DistancefromLandmark': distanceFromLandmark,
      // Add other properties here
    };
  }
}
