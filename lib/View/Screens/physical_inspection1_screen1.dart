import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> infrastructueOptions = [
    'good',
    'bad',
    'excellent',
    'super',
    'great'
  ];
  bool _validate = false;
  String selectedInfrastruture = "";
  String selctedNeighbour = "";
  String selectedlocality = "";
  String selectedproximity = "";
  String selctedMarketability = "";
  String selctedZone = "";
  String selctedBoundries = "";
  String selectedRelationship = "";
  String selectedPropertyOccupied = "";
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
  List<String> zones = [
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
  List<String> boundiresMatching = [
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
    'Under Construction',
    'External Visit Done hence cannot Comment',
    'Part self and part tenant',
    'NA'
  ];
  List<String>? filteredOptions;
  bool isEditable = false;

  TextEditingController _infrastructureController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();
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

  Future<void> updateLiveVisit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('2');

    final String? id = prefs.getString("id");
    print("id is:$id");

    try {
      Map<String, dynamic> requestBody = {
        "DistancefromLandmark": _distanceFromLandmarkRailwayController.text,
      };

      String phsicaljson = jsonEncode(requestBody);
      // requestBody["mmsheet"] = mmsheetJson;
      print("# $phsicaljson");
      Response response = await put(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/update_one_livevisit"),
          body: {"id": id, "PhysicalInI": phsicaljson});
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
      body: SingleChildScrollView(
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
                  selectedInfrastruture = value!;
                },
              ),
              // DropdownSearch(
              //   popupProps: PopupProps.menu(
              //     searchDelay: Duration(microseconds: 1),
              //     constraints: BoxConstraints.expand(
              //         height: MediaQuery.sizeOf(context).height,
              //         width: MediaQuery.sizeOf(context).width),
              //     searchFieldProps: TextFieldProps(
              //       cursorColor: Color(0xFF38C0CE),
              //       decoration: InputDecoration(
              //         prefixIconColor: MaterialStateColor.resolveWith(
              //             (states) => states.contains(MaterialState.focused)
              //                 ? Color(0xFF38C0CE)
              //                 : Colors.black),
              //         prefixIcon: Icon(
              //           Icons.search,
              //         ),
              //         focusedBorder: UnderlineInputBorder(
              //           borderSide:
              //               BorderSide(color: Color(0xFF38C0CE), width: 2),
              //         ),
              //       ),
              //     ),
              //     fit: FlexFit.loose,
              //     showSearchBox: true,
              //   ),
              //   items: infrastructueOptions,
              //   selectedItem: selectedOption,
              //   enabled: true,
              //   onChanged: (value) {
              //     selectedOption = value;
              //   },
              // ),
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
                  selctedNeighbour = value!;
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
                  selectedlocality = value!;
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
                    selectedproximity = value!;
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
                  selectedItem: selctedZone,
                  onChanged: (value) {
                    selctedZone = value!;
                  },
                  controller: _ZoneDpController),
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
                  items: zones,
                  selectedItem: selctedZone,
                  onChanged: (value) {
                    selctedZone = value!;
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
                controller: _rentController,
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
                  items: boundiresMatching,
                  selectedItem: selctedBoundries,
                  onChanged: (value) {
                    selctedBoundries = value!;
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
                  headingRowColor: MaterialStatePropertyAll(Color(0xFF38C0CE)),
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
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
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
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
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
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
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
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                      DataCell(
                          isEditable ? _buildEditableTextField() : Text('')),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditable = !isEditable;
                  });
                },
                child: Text(isEditable ? 'Done Editing' : 'Add/Edit'),
              ),
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
                    selectedPropertyOccupied = value!;
                  },
                  controller: _propertyOccupiedORVaccantController),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
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
                    selectedRelationship = value!;
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
                mainText: 'Name of reported owner as per site information',
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
                mainText: 'Compound wall and gates and security Average',
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
                mainText: 'Occupancy of Building',
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
        onTap: () {
          updateLiveVisit();
        },
      ),
    );
  }

  Widget _buildEditableTextField() {
    return TextFormField();
  }
}
