List<String> physicalstatusOptions = [
  "Completed and Occupied",
  "Completed and Ready for Possession",
  "Under Construction Work not in Progress",
  "Under Construction Work in Progress",
  "Open Plot",
  "Part Completed and Part work Pending"
];

List<String> voilationOptions = [
  "Not Applicable",
  "Two or more Individual Units Merged",
  "Change of Usage ",
  "Building Line Violation",
  "Vertical Violation",
  "FSI Violation",
  "Tenement Violation",
  "Approved plans not provided hence cannot comment",
  "Under Construction Property hence cannot comment",
  "Change of Permitted Usage",
  "Residential Property used as Commercial.",
  "Non FSI Area enclosed in to the Unit",
  "Construction not as per plan",
  "Internal Changes done in Unit",
  "Change in Unit Configuration",
  "Desktop Valuation done hence not applicable",
  "Only External Visit done hence cannot comment",
  "Change of Numbering of unit on floor",
  "Change of Numbering of Floors ( vertically)",
  "Horizontal Violation",
];

List<String> remarkviewoptions = [
  "Building View",
  "Cemetery View",
  "Main Road View",
  "Lake View",
  "Pond View",
  "River View",
  "Garden View",
  "Hill View",
  "Horizon View",
  "Nallah View",
  "Railway Track View",
  "Sea View",
  "Swimming Pool View",
  "View of Religious Structure",
  "Internal Road View",
  "Internal Compound View",
  "Internal Passage View",
  "Slum View",
  "Open Plot View",
  "Creek View",
];
List<String> numberOfWings = [
  "Standalone Structure",
  "Group Housing Scheme",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "More than 20",
  "Not Applicable",
  "Not Available"
];

List<String> numberOfLifts = [
  "Not Available",
  "Internal Visit not Allowed hence Cannot Comment",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "More Than 9",
];

List<String> exteriorOptions = [
  "Excellent",
  "Good ",
  "Average",
  "Poor",
  "Under Construction",
  "Under Renovation/Repairing",
  "Glass Facade",
  "Below Average",
  "NA",
];

List<String> interiorOptions = [
  "Excellent",
  "Good ",
  "Average",
  "Poor",
  "Needs Maintenance",
  "Under Construction",
  "Under Renovation/Repairing",
  "Bareshell Unit",
  "Internal Visit not Allowed hence Cannot Comment",
  "Below Average",
  "Not Applicable as property is plot",
];

List<String> fittingOptions = [
  "Concealed Plumbing and Concealed Electrical Fittings",
  "Partly Concealed Plumbing and Partly Concealed Electrical Fittings",
  "Open Plumbing and Electric Fittings",
  "Under Construction",
  "Internal Visit not Allowed hence Cannot Comment",
  "Under Renovation/Repairing",
  "Bare shell Unit hence not applicable",
  "Not Applicable as property is plot",
  "casing caping",
  "piping",
];

List<String> windowOptions = [
  "Internal Visit not Allowed hence Cannot Comment",
  "Aluminium Sliding",
  "French Window",
  "Louvered Windows",
  "Section Window",
  "Internal Visit not Done hence Cannot Comment",
  "Windows not applicable",
  "Under Construction",
  "MS Openable",
  "NA",
  "Aluminium Sliding",
  "PVC Sliding",
  "Glass facade",
  "anodised aluminium sliding",
  "wooden openable",
];

List<String> doorOptions = [
  "Internal Visit not Allowed hence Cannot Comment",
  "Glass Door",
  "Wooden Door",
  "Flush Door",
  "Sliding Door",
  "Collapsible Steel Door",
  "Rolling Steel Shutter Door",
  "Internal Visit not Done hence Cannot Comment",
  "piProperty Under Constructionping",
  "Safety Door",
  "Under Construction",
  "NA",
  "Not Applicable as property is plot",
];

List<String> maintainceLevelOptions = [
  "Excellent",
  "Good ",
  "Average",
  "Below Average",
  "Poor",
  "Need Maintenance- Structural Cracks Observed",
  "Need Maintenance- Plaster Cracks Observed",
  "Under Construction",
  "Dilapidated Condition",
  "Under Renovation",
  "Open Plot",
];

List<String> propertyAccOptions = [
  "1RK",
  "1BR",
  "2BR",
  "3BR",
  "4BR",
  "5BR",
  "OFF",
  "PEN",
  "PLT",
  "SHP",
];

List<String> independantOptions = [
  "Yes",
  "No",
  "Merged",
  "Internal Visit not Allowed hence Cannot Comment"
];

List<String> constructionOptions = [
  'Yes',
  'No',
  "Plan Not Verified",
  "Plan Not Applicable",
  "Under Construction hence Cannot Comment",
];

List<String> typeEtireBuildOptions = [
  "Residentail",
  "Commercial",
  "Industrial",
  "Residentail + Commercial"
];

List<String> detailCommercialUsageOptions = ["Yes", "No"];

List<String> infrastructueOptions = [
  'good',
  'bad',
  'excellent',
  'super',
  'great'
];

List<String> neighborhoodTypeoptionss = [
  "Aristrocrat",
  "Prime Residentaial",
  "Prime Commercial",
  "Prime Industrial",
  "Good Residential",
  "Good Commercial",
  "Good Industrial",
  "Average Residential",
  "Average Commercial",
  "Average Industrial",
  "Red Light Area",
  "Surrounded by Chawl",
  "Below Average Residential",
  "Below Average Commercial",
  "Below Average Industrial",
  "Industrial Commercial"
];

List<String> zoneoptions = [
  'Zone Certificate not provided',
  'Agricultural Zone',
  'No Development Zone',
  'Commercial Zone',
  'Industrail Zone',
  'Green Zone',
  'Residential Zone',
  'High Density Zone',
  'Low Density Zone',
  'Urbanisable Zone',
  'Institutional Zone',
  'CRZ',
  'Other Reservation'
];

List<String> boundiresMatchingoptions = [
  'Yes',
  'No',
  'Partly Matching',
  'Documnet Not Provided',
  'Details not mentioned in Documnet'
];

List<String> propertOccupiedOptions = [
  'Occupied',
  'Partly Self Occupied-Partly Vacant',
  'Partly Self Occupied-Partly Occupied by Tenant',
  'Partly Tenant Occupied-Partly Vacant',
  'Tenat Occupied',
  'Under Construction',
  'Renovation/Interior work in Progress',
  'Occasionally Occupied by Applicant',
  'Occasionally Occupied by Seller',
  'Internal Visit Not Done',
  'Internal Visit Not Allowed',
  'Please Refer Remarks',
  'Vacant',
  'Self Occuied'
];

List<String> occupantRelationOptions = [
  'Tenant',
  'Seller',
  'Self',
  'Vacant',
  "Relative Occupied",
  'Occasionally Occupied',
  "Under Construction",
  'External Visit Done hence cannot Comment',
  'Part self and part tenat',
  'NA'
];

List<String> statusOptions = [
  'Visit Done',
  'Visit Failed',
  'Partial Visit Done',
  'Hold Application'
];
