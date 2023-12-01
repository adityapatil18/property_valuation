import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';

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
  List<String> options = ['good', 'bad', 'excellent', 'super', 'great'];
  bool _validate = false;
  String? selectedOption;
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

  TextEditingController _textController = TextEditingController();
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
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _ratingController, options: options),
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
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _neighbourhoodTypeController,
                  options: neighborhoodTypeoptionss),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Distance from Bank/FI Branch',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _distnacefrombank,
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
                mainText: "Locality Connectivity from CBD",
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _localityRatingController, options: options),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Proximity to Amentites eg School,Mall etc',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _proximityController, options: options),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Name of nearest hospital',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _nearestHospitalController,
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
                mainText: 'Condition and width of approch road',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _roadConditionController,
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
                mainText: 'Name of nearest bus stop',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _bustopNameController,
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
                mainText: 'Marketability',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _marketablityController, options: options),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Rent',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _rentController,
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
                mainText: 'Zone as per city master Plan(DP)',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _ZoneDpController, options: zones),
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
                mainText: 'Boundires Matching',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _boundiresMatchingController,
                  options: boundiresMatching),
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
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _sitePersonNameController,
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
                mainText: 'Name of society board',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _societyNameController,
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
                mainText: 'Property occupied/vaccant',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _propertyOccupiedORVaccantController,
                  options: propertOccupiedOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Relation of occupant with customer',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _occupantNameController,
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
                mainText: 'Property occupied/vaccant',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _occupantRelationshipController,
                  options: occupantRelationOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Occupied Since',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _occupiedSinceController,
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
                mainText: 'Name of reported owner as per site information',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: _nameofReportedOwnerController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  }),
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
        onTap: () {},
      ),
    );
  }

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
      _textController.text = option;
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  Widget _buildEditableTextField() {
    return TextFormField();
  }
}
