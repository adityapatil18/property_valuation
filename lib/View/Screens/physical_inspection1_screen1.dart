import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';
import 'package:property_valuation/constant/list_of_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/navigator_conatiner.dart';
import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'case_status_screen.dart';
import 'home_screen.dart';
import 'images_screen.dart';
import 'mm_sheets_screen.dart';
import 'physical_inspection2_screen2.dart';
import 'tech_initiation_screen.dart';

class PhyscialInspection1Screen1 extends StatefulWidget {
  const PhyscialInspection1Screen1({super.key});

  @override
  State<PhyscialInspection1Screen1> createState() =>
      _PhyscialInspection1Screen1State();
}

class _PhyscialInspection1Screen1State
    extends State<PhyscialInspection1Screen1> {
  List<String> infrastructueOption = infrastructueOptions;
  List<String> neighborhoodTypeoption = neighborhoodTypeoptionss;
  List<String> zoneoption = zoneoptions;
  List<String> boundiresMatchingoption = boundiresMatchingoptions;
  List<String> propertOccupiedOption = propertOccupiedOptions;
  List<String> occupantRelationOption = occupantRelationOptions;
  String selectedInfrastruture = "";
  String selctedNeighbour = "";
  String selectedlocality = "";
  String selectedproximity = "";
  String selctedMarketability = "";
  String selctedZone = "";
  String selctedBoundries = "";
  String selectedRelationship = "";
  String selectedPropertyOccupied = "";

  List<String>? filteredOptions;
  // bool isEditable = false;
  bool _isLoading = true;
  TextEditingController _bs1Controller = TextEditingController();
  TextEditingController _bs2Controller = TextEditingController();
  TextEditingController _bs3Controller = TextEditingController();
  TextEditingController _bs4Controller = TextEditingController();
  TextEditingController _bd1Controller = TextEditingController();
  TextEditingController _bd2Controller = TextEditingController();
  TextEditingController _bd3Controller = TextEditingController();
  TextEditingController _bd4Controller = TextEditingController();
  TextEditingController _ds1Controller = TextEditingController();
  TextEditingController _ds2Controller = TextEditingController();
  TextEditingController _ds3Controller = TextEditingController();
  TextEditingController _ds4Controller = TextEditingController();
  TextEditingController _dd1Controller = TextEditingController();
  TextEditingController _dd2Controller = TextEditingController();
  TextEditingController _dd3Controller = TextEditingController();
  TextEditingController _dd4Controller = TextEditingController();
  TextEditingController _ms1Controller = TextEditingController();
  TextEditingController _ms2Controller = TextEditingController();
  TextEditingController _ms3Controller = TextEditingController();
  TextEditingController _ms4Controller = TextEditingController();
  TextEditingController _md1Controller = TextEditingController();
  TextEditingController _md2Controller = TextEditingController();
  TextEditingController _md3Controller = TextEditingController();
  TextEditingController _md4Controller = TextEditingController();

  TextEditingController _infrastructureController = TextEditingController();
  TextEditingController _distanceFromLandmarkRailwayController =
      TextEditingController();
  TextEditingController _neighbourhoodTypeController = TextEditingController();
  TextEditingController _distnacefrombank = TextEditingController();

  TextEditingController _localityRatingController = TextEditingController();
  TextEditingController _proximityController = TextEditingController();
  TextEditingController _nearestHospitalController = TextEditingController();
  TextEditingController _roadConditionController = TextEditingController();
  TextEditingController _bustopNameController = TextEditingController();
  TextEditingController _marketablityController = TextEditingController();
  TextEditingController _rentController = TextEditingController();

  TextEditingController _ZoneDpController = TextEditingController();
  TextEditingController _policeStationController = TextEditingController();
  TextEditingController _boundiresMatchingController = TextEditingController();
  TextEditingController _sitePersonNameController = TextEditingController();
  TextEditingController _societyNameController = TextEditingController();
  TextEditingController _propertyOccupiedORVaccantController =
      TextEditingController();
  TextEditingController _occupantNameController = TextEditingController();
  TextEditingController _occupantRelationshipController =
      TextEditingController();
  TextEditingController _occupiedSinceController = TextEditingController();
  TextEditingController _nameofReportedOwnerController =
      TextEditingController();
  TextEditingController _compoundWallandGatesController =
      TextEditingController();
  TextEditingController _occupancyOfBuildingContoller = TextEditingController();
  String? _currentSpecificId;

  @override
  void initState() {
    super.initState();
    // updateLiveVisit();
    // Call loadData when the state is initialized

    loadData();
    _loadCurrentSpecificId();
  }

  Future<void> _loadCurrentSpecificId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedSpecificId = prefs.getString('currentSpecificId');
    if (savedSpecificId != null) {
      setState(() {
        _currentSpecificId = savedSpecificId;
        print('Loaded Specific ID: $_currentSpecificId');
      });
    }
  }

  Future<void> updateLiveVisit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('2');

    final String? id = prefs.getString("currentSpecificId");
    print("id is:$id");

    try {
      Map<String, dynamic> requestBody = {
        "id": id,
        "PhysicalInI": [
          {
            "Infrastructure": _infrastructureController.text,
            "DistancefromLandmark": _distanceFromLandmarkRailwayController.text,
            "DistanceFromBank": _distnacefrombank.text,
            "NameofNearestHospital": _nearestHospitalController.text,
            "Conditionandwidthofapproachroad": "",
            "NameofNearestBusStop": _bustopNameController.text,
            "BOUNDARIES_AS_PER_SITE1": _bs1Controller.text,
            "BOUNDARIES_AS_PER_DEED1": _bd1Controller.text,
            "DIMENSION_AS_PER_SITE1": _ds1Controller.text,
            "DIMENSION_AS_PER_DEED1": _dd1Controller.text,
            "MOS_AS_PER_SITE1": _ms1Controller.text,
            "MOS_AS_PER_DEED1": _md1Controller.text,
            "BOUNDARIES_AS_PER_SITE2": _bs2Controller.text,
            "BOUNDARIES_AS_PER_DEED2": _bd1Controller.text,
            "DIMENSION_AS_PER_SITE2": _ds2Controller.text,
            "DIMENSION_AS_PER_DEED2": _dd2Controller.text,
            "MOS_AS_PER_SITE2": _ms2Controller.text,
            "MOS_AS_PER_DEED2": _md2Controller.text,
            "BOUNDARIES_AS_PER_SITE3": _bs3Controller.text,
            "BOUNDARIES_AS_PER_DEED3": _bd3Controller.text,
            "DIMENSION_AS_PER_SITE3": _ds3Controller.text,
            "DIMENSION_AS_PER_DEED3": _dd3Controller.text,
            "MOS_AS_PER_SITE3": _ms3Controller.text,
            "MOS_AS_PER_DEED3": _md3Controller.text,
            "BOUNDARIES_AS_PER_SITE4": _bs4Controller.text,
            "BOUNDARIES_AS_PER_DEED4": _bd4Controller.text,
            "DIMENSION_AS_PER_SITE4": _ds4Controller.text,
            "DIMENSION_AS_PER_DEED4": _dd4Controller.text,
            "MOS_AS_PER_SITE4": _ms4Controller.text,
            "MOS_AS_PER_DEED4": _md4Controller.text,
            "NameofPersonMetatSite": _sitePersonNameController.text,
            "ContactofPersonMetatSite": "",
            "Nameonsocietyboard": _societyNameController.text,
            "NameofOccupan": _occupantNameController.text,
            "OccupiedSince": _occupiedSinceController.text,
            "NameofReportedOwnerasperSiteInformation":
                _nameofReportedOwnerController.text,
            "LandHolding": "",
            "NeighbourhoodGroup": _neighbourhoodTypeController.text,
            "Marketability": _marketablityController.text,
            "Property": _propertyOccupiedORVaccantController.text,
            "Boundaries": _boundiresMatchingController.text,
            "Relationship": _occupantRelationshipController.text,
            "LocalityConnectivity": _localityRatingController.text,
            "Proximity": _proximityController.text,
            "ZoneAsperCity": _ZoneDpController.text
          }
        ]
      };

      String phsicaljson = jsonEncode(requestBody);
      // requestBody["mmsheet"] = mmsheetJson;
      print("# $phsicaljson");
      Response response = await put(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/update_one_livevisit"),
          headers: {"Content-Type": "application/json"},
          body: phsicaljson);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("API response: ${response.body}");

        print("API response: $responseData");
        print("PUT request successful");
        print("Response status code: ${response.statusCode}");
      } else {
        print("error is :${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error during PUT request: $e");
    }
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
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
        title: TextWidget(
          text: 'Physical Inspection One',
          textcolor: Colors.white,
          textsize: 18,
          textweight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
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
      body: _isLoading
          ? Center(child: LoadingIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: "DETAIL OF PROPERTY LOCATION",
                      textcolor: Colors.black,
                      textsize: 18,
                      textweight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const CustomRichText(
                      mainText: 'Infrastructure of surrounding area',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                      controller: _infrastructureController,
                      items: infrastructueOptions,
                      selectedItem: selectedInfrastruture,
                      onChanged: (value) {
                        setState(() {
                          selectedInfrastruture = value!;
                          _infrastructureController.text = value;
                          print(
                              "Controller Value for : ${_infrastructureController.text}");
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Distance from Landmark/Railway Station',
                      isRequired: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: _distanceFromLandmarkRailwayController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Neighbourhood Type',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                      controller: _neighbourhoodTypeController,
                      items: neighborhoodTypeoptionss,
                      selectedItem: selctedNeighbour,
                      onChanged: (value) {
                        setState(() {
                          selctedNeighbour = value!;
                          _neighbourhoodTypeController.text = value;
                          print("ss:${_neighbourhoodTypeController.text}");
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Distance from Bank/FI Branch',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _distnacefrombank,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: "Locality Connectivity from CBD",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                      controller: _localityRatingController,
                      items: infrastructueOptions,
                      selectedItem: selectedlocality,
                      onChanged: (value) {
                        setState(() {
                          selectedlocality = value!;
                          _localityRatingController.text = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Proximity to Amentites eg School,Mall etc',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                        items: infrastructueOptions,
                        selectedItem: selectedproximity,
                        onChanged: (value) {
                          setState(() {
                            selectedproximity = value!;
                            _proximityController.text = value;
                          });
                        },
                        controller: _proximityController),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Name of nearest hospital',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _nearestHospitalController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Condition and width of approch road',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _roadConditionController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Name of nearest bus stop',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _bustopNameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Marketability',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                        items: infrastructueOptions,
                        selectedItem: selctedMarketability,
                        onChanged: (value) {
                          setState(() {
                            selctedMarketability = value!;
                            _marketablityController.text = value;
                          });
                        },
                        controller: _marketablityController),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Rent',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _rentController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Zone as per city master Plan(DP)',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                        items: zoneoption,
                        selectedItem: selctedZone,
                        onChanged: (value) {
                          setState(() {
                            selctedZone = value!;
                            _ZoneDpController.text = value;
                          });
                        },
                        controller: _ZoneDpController),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Name of Police Station',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _policeStationController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Boundires Matching',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                        items: boundiresMatchingoptions,
                        selectedItem: selctedBoundries,
                        onChanged: (value) {
                          setState(() {
                            selctedBoundries = value!;
                            _boundiresMatchingController.text = value;
                            print("${selctedBoundries.toString()}");
                            print(
                                "Controller Value for Property Occupied: ${_boundiresMatchingController.text}");
                          });
                        },
                        controller: _boundiresMatchingController),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFF38C0CE),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                        text: 'BUILDING/PLOT BOUNDRIES AND DIMENSIONS',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        border: TableBorder.all(color: Colors.black),
                        headingRowColor:
                            MaterialStatePropertyAll(Color(0xFF38C0CE)),
                        columnSpacing: 16.0,
                        horizontalMargin: 12.0,
                        columns: [
                          DataColumn(label: Text('Direction')),
                          DataColumn(label: Text('Boundaries (as per site)')),
                          DataColumn(label: Text('Boundaries (as per deed)')),
                          DataColumn(label: Text('Dimension (as per site)')),
                          DataColumn(label: Text('Dimension (as per deed)')),
                          DataColumn(label: Text('MOS (as per site)')),
                          DataColumn(label: Text('MOS (as per deed)')),
                        ],
                        rows: [
                          // Data rows
                          DataRow(cells: [
                            DataCell(
                              TextWidget(
                                text: 'East',
                                textcolor: Colors.black,
                                textsize: 14,
                                textweight: FontWeight.w500,
                              ),
                            ),
                            DataCell(TextField(
                              controller: _bs1Controller,
                            )),
                            DataCell(TextField(
                              controller: _bd1Controller,
                            )),
                            DataCell(TextField(
                              controller: _ds1Controller,
                            )),
                            DataCell(TextField(
                              controller: _dd1Controller,
                            )),
                            DataCell(TextField(
                              controller: _ms1Controller,
                            )),
                            DataCell(TextField(
                              controller: _md1Controller,
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              TextWidget(
                                text: 'West',
                                textcolor: Colors.black,
                                textsize: 14,
                                textweight: FontWeight.w500,
                              ),
                            ),
                            DataCell(TextField(
                              controller: _bs2Controller,
                            )),
                            DataCell(TextField(
                              controller: _bd2Controller,
                            )),
                            DataCell(TextField(
                              controller: _ds2Controller,
                            )),
                            DataCell(TextField(
                              controller: _dd2Controller,
                            )),
                            DataCell(TextField(
                              controller: _ms2Controller,
                            )),
                            DataCell(TextField(
                              controller: _md2Controller,
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              TextWidget(
                                text: 'North',
                                textcolor: Colors.black,
                                textsize: 14,
                                textweight: FontWeight.w500,
                              ),
                            ),
                            DataCell(TextField(
                              controller: _bs3Controller,
                            )),
                            DataCell(TextField(
                              controller: _bd3Controller,
                            )),
                            DataCell(TextField(
                              controller: _ds3Controller,
                            )),
                            DataCell(TextField(
                              controller: _dd3Controller,
                            )),
                            DataCell(TextField(
                              controller: _ms3Controller,
                            )),
                            DataCell(TextField(
                              controller: _md3Controller,
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              TextWidget(
                                text: 'South',
                                textcolor: Colors.black,
                                textsize: 14,
                                textweight: FontWeight.w500,
                              ),
                            ),
                            DataCell(TextField(
                              controller: _bs4Controller,
                            )),
                            DataCell(TextField(
                              controller: _bd4Controller,
                            )),
                            DataCell(TextField(
                              controller: _ds4Controller,
                            )),
                            DataCell(TextField(
                              controller: _dd4Controller,
                            )),
                            DataCell(TextField(
                              controller: _ms4Controller,
                            )),
                            DataCell(TextField(
                              controller: _md4Controller,
                            )),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStatePropertyAll(Colors.green)),
                    //   onPressed: () {
                    //     setState(() {
                    //     });
                    //   },
                    //   child: Text(
                    //       style: TextStyle(color: Colors.white),
                    //       isEditable ? 'Done Editing' : 'Add/Edit'),
                    // ),
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
                        text: 'DETAIL OF CUSTOMER MEETING',
                        textcolor: Colors.black,
                        textsize: 18,
                        textweight: FontWeight.w700),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Name of person me at site',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _sitePersonNameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      isRequired: true,
                      mainText: 'Name of society board',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _societyNameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Property occupied/vaccant',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                        items: propertOccupiedOptions,
                        selectedItem: selectedPropertyOccupied,
                        onChanged: (value) {
                          setState(() {
                            selectedPropertyOccupied = value!;
                            _propertyOccupiedORVaccantController.text = value;
                            print(
                                "Controller Value for Property Occupied: ${_propertyOccupiedORVaccantController.text}");
                          });
                        },
                        controller: _propertyOccupiedORVaccantController),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      isRequired: true,
                      mainText: 'Name of occupant',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _occupantNameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Relationship of occupant with customer',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDropdownSearch(
                        items: occupantRelationOptions,
                        selectedItem: selectedRelationship,
                        onChanged: (value) {
                          setState(() {
                            selectedRelationship = value!;
                            _occupantRelationshipController.text = value;
                          });
                        },
                        controller: _occupantRelationshipController),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Occupied Since',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _occupiedSinceController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText:
                          'Name of reported owner as per site information',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _nameofReportedOwnerController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      isRequired: true,
                      mainText: 'Compound wall and gates and security Average',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _compoundWallandGatesController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      isRequired: true,
                      mainText: 'Occupancy of Building',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _occupancyOfBuildingContoller,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: GestureDetector(
        child: NavigatorConatiner(),
        onTap: () async {
          try {
            if (_distanceFromLandmarkRailwayController.text.isEmpty &&
                _societyNameController.text.isEmpty &&
                _occupantNameController.text.isEmpty &&
                _compoundWallandGatesController.text.isEmpty &&
                _occupancyOfBuildingContoller.text.isEmpty) {
              // Show an error message if the landmark field is empty
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Add required fields'),
                  duration: Duration(seconds: 2),
                ),
              );
              return; // Exit the method without updating if the landmark field is empty
            }
            await updateLiveVisit();

// If the update is successful, navigate to the next screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhysicalInspection2Screen2(),
              ),
            );

            // If the update is successful, show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Data updated successfully!'),
                duration: Duration(seconds: 2),
              ),
            );
            // Clear controller values
            _infrastructureController.clear();
            _distanceFromLandmarkRailwayController.clear();
            _neighbourhoodTypeController.clear();
            _distnacefrombank.clear();
            _localityRatingController.clear();
            _proximityController.clear();
            _ZoneDpController.clear();
            _boundiresMatchingController.clear();
            _bustopNameController.clear();
            _compoundWallandGatesController.clear();
            _marketablityController.clear();
            _nameofReportedOwnerController.clear();
            _nearestHospitalController.clear();
            _societyNameController.clear();
            _occupancyOfBuildingContoller.clear();
            _occupantNameController.clear();
            _occupantRelationshipController.clear();
            _occupiedSinceController.clear();
            _policeStationController.clear();
            _propertyOccupiedORVaccantController.clear();
            _rentController.clear();
            _roadConditionController.clear();
            _sitePersonNameController.clear();
            _bs1Controller.clear();
            _bs2Controller.clear();
            _bs3Controller.clear();
            _bs4Controller.clear();
            _bd1Controller.clear();
            _bd2Controller.clear();
            _bd3Controller.clear();
            _bd4Controller.clear();
            _ds1Controller.clear();
            _ds2Controller.clear();
            _ds3Controller.clear();
            _ds4Controller.clear();
            _dd1Controller.clear();
            _dd2Controller.clear();
            _dd3Controller.clear();
            _dd4Controller.clear();
            _ms1Controller.clear();
            _ms2Controller.clear();
            _ms3Controller.clear();
            _ms4Controller.clear();
            _md1Controller.clear();
            _md2Controller.clear();
            _md3Controller.clear();
            _md4Controller.clear();
            // Clear other controllers as needed
          } catch (e) {
            // Handle error if the update fails
            print("Error updating data: $e");
          }
        },
      ),
    );
  }
}
