import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:property_valuation/View/Screens/images_screen.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'case_status_screen.dart';
import 'home_screen.dart';
import 'mm_sheets_screen.dart';
import 'physical_inspection1_screen1.dart';
import 'tech_initiation_screen.dart';

class PhysicalInspection2Screen2 extends StatefulWidget {
  const PhysicalInspection2Screen2({super.key});

  @override
  State<PhysicalInspection2Screen2> createState() =>
      _PhysicalInspection2Screen2State();
}

class _PhysicalInspection2Screen2State
    extends State<PhysicalInspection2Screen2> {
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
  String selectedPhysicalStatus = "";
  // String selectedViolataion = "";
  String selectedRemarkView = "";
  String selectednumberOfWings = "";
  String selcetednumberOfLifts = "";
  String selectedExterior = "";
  String selectedInterior = "";
  String selectedFitting = "";
  String selectedWindow = "";
  String selectedDoor = "";
  String selectedMaintanceLevel = "";
  String selectedPropertyAcc = "";
  String selectedIndepent = "";
  String selectedConstruction = "";
  String selectedCommercialUsage = "";
  String selectedEntireBuildType = "";
  List<String> selectedViolataion = [];
  List? _myActivities;
  late String _myActivitiesResult;
  TextEditingController _physicalstatusController = TextEditingController();
  TextEditingController _pecentageController = TextEditingController();
  TextEditingController _propertyType = TextEditingController();
  TextEditingController _propertyUsage = TextEditingController();
  TextEditingController _voilationObserved = TextEditingController();
  TextEditingController _indipendentUit = TextEditingController();
  TextEditingController _remarkviewProperty = TextEditingController();
  TextEditingController _perflooraAndPositionUnit = TextEditingController();
  TextEditingController _amentiesAvailable = TextEditingController();
  TextEditingController _accomendationUnit = TextEditingController();
  TextEditingController _wingsINSoceiety = TextEditingController();
  TextEditingController _constructionType = TextEditingController();
  TextEditingController _numberOfStoyires = TextEditingController();
  TextEditingController _numberofLifts = TextEditingController();
  TextEditingController _exterior = TextEditingController();
  TextEditingController _interior = TextEditingController();
  TextEditingController _fitting = TextEditingController();
  TextEditingController _flooring = TextEditingController();
  TextEditingController _window = TextEditingController();
  TextEditingController _door = TextEditingController();
  TextEditingController _propertyAge = TextEditingController();
  TextEditingController _maintainceLevel = TextEditingController();
  TextEditingController _popertyACCValue = TextEditingController();
  TextEditingController _independentacess = TextEditingController();
  TextEditingController _selctConstructionPlan = TextEditingController();
  TextEditingController _commercialUsageDetails = TextEditingController();
  TextEditingController _entireBldgType = TextEditingController();
  TextEditingController _yearOfConstruction = TextEditingController();
  TextEditingController _souurondedBy = TextEditingController();
  TextEditingController _residualAge = TextEditingController();
  TextEditingController _remark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF38C0CE),
        // centerTitle: true,
        title: TextWidget(
            text: 'Physical Inspection Two',
            textcolor: Colors.white,
            textsize: 18,
            textweight: FontWeight.w500),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
          CustomPopupMenuButton(onSelected: (value) {
            switch (value) {
              case 'techInitiation':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TechInitiationScreen()),
                );
                break;
              case 'images':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagesScreen()),
                );
                break;
              case 'mmSheets':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MMSheetsScreen()),
                );
                break;
              case 'physicalInspection1':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhyscialInspection1Screen1()),
                );
                break;
              case 'physicalInspection2':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhysicalInspection2Screen2()),
                );
                break;
              case 'caseStatus':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaseStatusScreen()),
                );
                break;
            }
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: 'DETAIL OF PROPERTY LOCATION',
                  textcolor: Colors.black,
                  textsize: 16,
                  textweight: FontWeight.w700),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Physical Status of project',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: physicalstatusOptions,
                  selectedItem: selectedPhysicalStatus,
                  onChanged: (value) {
                    setState(() {
                      selectedPhysicalStatus = value!;
                      _physicalstatusController.text = value;
                    });
                  },
                  controller: _physicalstatusController),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Percentage of construction',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _pecentageController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Type of Property',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _propertyType, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Property usage',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _propertyUsage, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              // CustomRichText(
              //   mainText: 'Voilation Observed',
              // ),
              SizedBox(
                height: 5,
              ),
              // MultiSelectDialogField(
              //   items:
              //       ["1", "2", "3"].map((e) => MultiSelectItem(e, e)).toList(),
              //   title: Text('Selected Options'),
              //   onConfirm: (value) {
              //     setState(() {
              //       selectedViolataion = value;
              //     });
              //   },
              // ),
              MultiSelectFormField(
                chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                title: Text('Vivolation Observed'),
                dataSource: [
                  {"display": "Not Applicable", "value": "Not Applicable"},
                  {
                    "display": "Climbing",
                    "value": "Climbing",
                  },
                  {
                    "display": "Walking",
                    "value": "Walking",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                initialValue: _myActivities,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myActivities = value;
                  });
                },
              ),
              SizedBox(height: 16),
              // Text('Selected Options: ${selectedViolataion.join(', ')}'),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Floor No in case of independent unit',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _indipendentUit),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Remark on view from property',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: remarkviewoptions,
                  selectedItem: selectedRemarkView,
                  onChanged: (value) {
                    setState(() {
                      selectedRemarkView = value!;
                      _remarkviewProperty.text = value;
                    });
                  },
                  controller: _remarkviewProperty),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of units per floor and position of unit',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _perflooraAndPositionUnit),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Amenities Available in Socity',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _amentiesAvailable,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Accmodation of unit',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _accomendationUnit),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of wings in society',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: numberOfWings,
                  selectedItem: selectednumberOfWings,
                  onChanged: (value) {
                    setState(() {
                      selectednumberOfWings = value!;
                      _wingsINSoceiety.text = value;
                    });
                  },
                  controller: _wingsINSoceiety),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Construction type',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _constructionType,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of storyes',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _numberOfStoyires),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of lifts',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: numberOfLifts,
                  selectedItem: selcetednumberOfLifts,
                  onChanged: (value) {
                    setState(() {
                      selcetednumberOfLifts = value!;
                      _numberofLifts.text = value;
                    });
                  },
                  controller: _numberofLifts),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Exterior',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: exteriorOptions,
                  selectedItem: selectedExterior,
                  onChanged: (value) {
                    selectedExterior = value!;
                    _exterior.text = value;
                  },
                  controller: _exterior),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Interior',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: interiorOptions,
                  selectedItem: selectedInterior,
                  onChanged: (value) {
                    selectedInterior = value!;
                    _interior.text = value;
                  },
                  controller: _interior),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Fitting',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: fittingOptions,
                  selectedItem: selectedFitting,
                  onChanged: (value) {
                    selectedFitting = value!;
                    _fitting.text = value;
                  },
                  controller: _fitting),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Flooring',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _flooring, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Window',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: windowOptions,
                  selectedItem: selectedWindow,
                  onChanged: (value) {
                    selectedWindow = value!;
                    _window.text = value;
                  },
                  controller: _window),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Door',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: doorOptions,
                  selectedItem: selectedDoor,
                  onChanged: (value) {
                    selectedDoor = value!;
                    _door.text = value;
                  },
                  controller: _door),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Property Age',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _propertyAge),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Mainataince level of society/project',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: maintainceLevelOptions,
                  selectedItem: selectedMaintanceLevel,
                  onChanged: (value) {
                    selectedMaintanceLevel = value!;
                    _maintainceLevel.text = value;
                  },
                  controller: _maintainceLevel),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Occupancy Level',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: propertyAccOptions,
                  selectedItem: selectedPropertyAcc,
                  onChanged: (value) {
                    selectedPropertyAcc = value!;
                    _popertyACCValue.text = value;
                  },
                  controller: _popertyACCValue),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText:
                    'Is there poperty an independent unit has independent access',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: independantOptions,
                  selectedItem: selectedIndepent,
                  onChanged: (value) {
                    selectedIndepent = value!;
                    _independentacess.text = value;
                  },
                  controller: _independentacess),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Select Construction as per plan',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: constructionOptions,
                  selectedItem: selectedConstruction,
                  onChanged: (value) {
                    selectedConstruction = value!;
                    _selctConstructionPlan.text = value;
                  },
                  controller: _selctConstructionPlan),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Details of commercial usage',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: detailCommercialUsageOptions,
                  selectedItem: selectedCommercialUsage,
                  onChanged: (value) {
                    selectedCommercialUsage = value!;
                    _commercialUsageDetails.text = value;
                  },
                  controller: _commercialUsageDetails),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Type of entire bldg',
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdownSearch(
                  items: typeEtireBuildOptions,
                  selectedItem: selectedEntireBuildType,
                  onChanged: (value) {
                    setState(() {
                      selectedEntireBuildType = value!;
                      _entireBldgType.text = value;
                    });
                  },
                  controller: _entireBldgType),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Year of construction',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _yearOfConstruction),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText:
                    'Wheather surrounded by Mosques,Temples,Burning ghat,Cermatorium,etc.',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _souurondedBy),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Rsidual Age',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _residualAge),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF38C0CE),
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget(
                  text: 'VALUATION OBSERVATIONS',
                  textcolor: Colors.black,
                  textsize: 18,
                  textweight: FontWeight.w700),
              SizedBox(
                height: 10,
              ),
              CustomTextField(controller: _remark)
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: MediaQuery.sizeOf(context).width,
          color: Color(0xFF38C0CE),
          child: TextWidget(
              text: 'Submit to Propval',
              textcolor: Colors.white,
              textsize: 18,
              textweight: FontWeight.w500),
        ),
        onTap: () {},
      ),
    );
  }
}
