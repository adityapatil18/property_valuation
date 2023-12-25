import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:property_valuation/View/Screens/images_screen.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';
import 'package:property_valuation/constant/list_of_options.dart';
import 'package:property_valuation/model/property_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/navigator_conatiner.dart';
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
  bool _isLoading = true;

  List<String> physicalstatusOption = physicalstatusOptions;
  List<String> voilationOption = voilationOptions;
  List<String> remarkviewoption = remarkviewoptions;
  List<String> numberOfWing = numberOfWings;
  List<String> numberOfLift = numberOfLifts;
  List<String> exteriorOption = exteriorOptions;
  List<String> interiorOption = interiorOptions;
  List<String> fittingOption = fittingOptions;
  List<String> windowOption = windowOptions;
  List<String> doorOption = doorOptions;
  List<String> maintainceLevelOption = maintainceLevelOptions;
  List<String> propertyAccOption = propertyAccOptions;
  List<String> independantOption = independantOptions;
  List<String> constructionOption = constructionOptions;
  List<String> typeEtireBuildOption = typeEtireBuildOptions;
  List<String> detailCommercialUsageOption = detailCommercialUsageOptions;

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
  List? _violationObservedValues;
  List? _amentiesValues;
  List? _constructionTypeValues;
  List? _flooringValues;
  late String _myActivitiesResult;
  TextEditingController _physicalstatusController = TextEditingController();
  TextEditingController _pecentageController = TextEditingController();
  TextEditingController _propertyType = TextEditingController();
  TextEditingController _propertyUsage = TextEditingController();
  TextEditingController _indipendentUit = TextEditingController();
  TextEditingController _remarkviewProperty = TextEditingController();
  TextEditingController _perflooraAndPositionUnit = TextEditingController();
  TextEditingController _accomendationUnit = TextEditingController();
  TextEditingController _wingsINSoceiety = TextEditingController();
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
  TextEditingController _independentacess = TextEditingController();
  TextEditingController _selctConstructionPlan = TextEditingController();
  TextEditingController _commercialUsageDetails = TextEditingController();
  TextEditingController _entireBldgType = TextEditingController();
  TextEditingController _yearOfConstruction = TextEditingController();
  TextEditingController _souurondedBy = TextEditingController();
  TextEditingController _residualAge = TextEditingController();
  TextEditingController _remark = TextEditingController();
  List<PropertyListData> propertyOptions1 = [];
  List<PropertyListData> propertyOptions2 = [];

  PropertyListData? selcetedOption1;
  PropertyListData? selcetedOption2;

  Future<void> updateLiveVisit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString("id");
    print("id is:$id");

    try {
      String propertyId1 = selcetedOption1?.id ?? "";
      String propertyId2 = selcetedOption2?.id ?? "";

      Map<String, dynamic> requestBody = {
        "id": id,
        "PhysicalInII": [
          {
            "PercentageOfConstruction": _pecentageController.text,
            "FloorNoincaseofIndependentUnit": _indipendentUit.text,
            "NoofUnitsperFloorAndPositionofUnits":
                _perflooraAndPositionUnit.text,
            "AccommodationOfFlat": _accomendationUnit.text,
            "NoOfStoreys": _numberOfStoyires.text,
            "PropertyAge": _propertyAge.text,
            "ResidualAge": _residualAge.text,
            "OccupancyStatus": "",
            "EngineerRemarks": _remark.text,
            "StageOfConstruction": null,
            "Detail_Text": null,
            "TypeOfProperty": propertyId1,
            "Usage": propertyId2,
            "ConstructionAsPerPlan": "",
            "Violation": _violationObservedValues?.join(","),
            "CommercialUsage": _commercialUsageDetails.text,
            "Remarksonview": _remarkviewProperty.text,
            "ConstructionType": _constructionTypeValues?.join(","),
            "Lifts": _numberofLifts.text,
            "Exterior": _exterior.text,
            "Interior": _interior.text,
            "Flooring": _flooringValues?.join(","),
            "Fittings": _fitting.text,
            "Door": _door.text,
            "Window": _window.text,
            "Maintenance": _maintainceLevel.text,
            "AmenitiesAvailableInSociety": _amentiesValues?.join(","),
            "Details_of_Construction": [
              {
                "FootingExcavation": "Not Completed",
                "Plinth": "Not Completed",
                "Slabs_Completed": null,
                "Slabs_Total": null,
                "ExternalBrickwork_Completed": null,
                "ExternalBrickwork_Total": null,
                "InternalBrickwork": null,
                "InternalPlaster": null,
                "ExternalPlaster": null,
                "Flooring": null,
                "Gypsum": null,
                "Plumbing": null,
                "LiftInstallation": "Not Installed",
                "date_of_visit1": null,
                "date_of_visit1_per": null,
                "date_of_visit2": null,
                "date_of_visit2_per": null,
                "date_of_visit3": null,
                "date_of_visit3_per": null,
                "date_of_visit4": null,
                "date_of_visit4_per": null,
                "date_of_visit5": null,
                "date_of_visit5_per": null,
                "date_of_visit6": null,
                "date_of_visit6_per": null
              }
            ],
            "PhysicalStatus": _physicalstatusController.text,
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

  Future<void> fetchPropertyOptions() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://apivaluation.techgigs.in/admin/property/get-property_list",
        ),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        PropertyPouUpList propertyList =
            PropertyPouUpList.fromJson(responseData);
        List<PropertyListData> options = propertyList.data;
        print("list:$options");
        setState(() {
          propertyOptions1 = options;
          print("lists:$propertyOptions1");
        });
      } else {
        print(
          'Failed to fetch property options. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error in fetchPropertyOptions: $e');
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
  void initState() {
    super.initState();

    setState(() {
      fetchPropertyOptions();
    });
    loadData();
  }

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
      body: _isLoading
          ? Center(child: LoadingIndicator())
          : SingleChildScrollView(
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
                        items: physicalstatusOption,
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
                    DropdownSearch<PropertyListData>(
                      popupProps: PopupProps.menu(
                        searchDelay: Duration(microseconds: 1),
                        constraints: BoxConstraints.expand(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width),
                        searchFieldProps: TextFieldProps(
                          controller: _propertyType,
                          cursorColor: Color(0xFF38C0CE),
                          autocorrect: true,
                          decoration: InputDecoration(
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    states.contains(MaterialState.focused)
                                        ? Color(0xFF38C0CE)
                                        : Colors.black),
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF38C0CE), width: 2),
                            ),
                          ),
                        ),
                        fit: FlexFit.loose,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('${item.name}'),
                          );
                        },
                      ),
                      compareFn: (PropertyListData item,
                              PropertyListData selectedItem) =>
                          item.id == selectedItem.id,
                      selectedItem: selcetedOption1,
                      itemAsString: (PropertyListData item) => '${item.name}',
                      items: propertyOptions1,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      onChanged: (
                        PropertyListData? val,
                      ) {
                        setState(() {
                          selcetedOption1 = val;
                          // Additional logic if needed
                        });
                      },
                      onSaved: (PropertyListData? newValue) {
                        setState(() {
                          selcetedOption1 = newValue;
                          // Additional logic if needed
                        });
                      },
                      validator: (PropertyListData? value) {
                        if (value == null || value.name.isEmpty) {
                          return 'Location is required';
                        }
                        return null; // Return null if validation passes
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Property usage',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownSearch<PropertyListData>(
                      popupProps: PopupProps.menu(
                        searchDelay: Duration(microseconds: 1),
                        constraints: BoxConstraints.expand(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width),
                        searchFieldProps: TextFieldProps(
                          controller: _propertyUsage,
                          cursorColor: Color(0xFF38C0CE),
                          autocorrect: true,
                          decoration: InputDecoration(
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    states.contains(MaterialState.focused)
                                        ? Color(0xFF38C0CE)
                                        : Colors.black),
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF38C0CE), width: 2),
                            ),
                          ),
                        ),
                        fit: FlexFit.loose,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('${item.name}'),
                          );
                        },
                      ),
                      compareFn: (PropertyListData item,
                              PropertyListData selectedItem) =>
                          item.id == selectedItem.id,
                      selectedItem: selcetedOption2,
                      itemAsString: (PropertyListData item) => '${item.name}',
                      items: propertyOptions1,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      onChanged: (
                        PropertyListData? val,
                      ) {
                        setState(() {
                          selcetedOption2 = val;
                          // Additional logic if needed
                        });
                      },
                      onSaved: (PropertyListData? newValue) {
                        setState(() {
                          selcetedOption2 = newValue;
                          // Additional logic if needed
                        });
                      },
                      validator: (PropertyListData? value) {
                        if (value == null || value.name.isEmpty) {
                          return 'Location is required';
                        }
                        return null; // Return null if validation passes
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Voilation Observed',
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    MultiSelectFormField(
                      border: OutlineInputBorder(),
                      title: Text('Vivolation Observed'),
                      dataSource: [
                        {
                          "display": "Not Applicable",
                          "value": "Not Applicable"
                        },
                        {
                          "display": "Two or more Individual Units Merged",
                          "value": "Two or more Individual Units Merged",
                        },
                        {
                          "display": "Change of Usage ",
                          "value": "Change of Usage"
                        },
                        {
                          "display": "Building Line Violation",
                          "value": "Building Line Violation"
                        },
                        {
                          "display": "Vertical Violation",
                          "value": "Vertical Violation"
                        },
                        {"display": "FSI Violation", "value": "FSI Violation"},
                        {
                          "display": "Tenement Violation",
                          "value": "Tenement Violation"
                        },
                        {
                          "display":
                              "Approved plans not provided hence cannot comment",
                          "value":
                              "Approved plans not provided hence cannot comment"
                        },
                        {
                          "display":
                              "Under Construction Property hence cannot comment",
                          "value":
                              "Under Construction Property hence cannot comment"
                        },
                        {
                          "display": "Change of Permitted Usage",
                          "value": "Change of Permitted Usage"
                        },
                        {
                          "display": "Residential Property used as Commercial.",
                          "value": "Residential Property used as Commercial."
                        },
                        {
                          "display": "Non FSI Area enclosed in to the Unit",
                          "value": "Non FSI Area enclosed in to the Unit"
                        },
                        {
                          "display": "Construction not as per plan",
                          "value": "Construction not as per plan"
                        },
                        {
                          "display": "Internal Changes done in Unit",
                          "value": "Internal Changes done in Unit"
                        },
                        {
                          "display": "Change in Unit Configuration",
                          "value": "Change in Unit Configuration"
                        },
                        {
                          "display":
                              "Desktop Valuation done hence not applicable",
                          "value": "Desktop Valuation done hence not applicable"
                        },
                        {
                          "display":
                              "Only External Visit done hence cannot comment",
                          "value":
                              "Only External Visit done hence cannot comment"
                        },
                        {
                          "display": "Change of Numbering of unit on floor",
                          "value": "Change of Numbering of unit on floor"
                        },
                        {
                          "display":
                              "Change of Numbering of Floors ( vertically)",
                          "value": "Change of Numbering of Floors ( vertically)"
                        },
                        {
                          "display": "Horizontal Violation",
                          "value": "Horizontal Violation"
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      initialValue: _violationObservedValues,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _violationObservedValues = value;
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
                        items: remarkviewoption,
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
                    MultiSelectFormField(
                      border: OutlineInputBorder(),
                      title: Text('Amenities Available in Socity'),
                      dataSource: [
                        {
                          "display": "Double Height Entrance Lobby",
                          "value": "Double Height Entrance Lobby"
                        },
                        {"display": "Swimming Pool", "value": "Swimming Pool"},
                        {"display": "Garden", "value": "Garden"},
                        {"display": "Golf Course", "value": "Golf Course"},
                        {"display": "Club House", "value": "Club House"},
                        {"display": "Tennis Court", "value": "Tennis Court"},
                        {"display": "Jogging Track", "value": "Jogging Track"},
                        {"display": "Food Court", "value": "Food Court"},
                        {"display": "Temple", "value": "Temple"},
                        {"display": "Gymnasium", "value": "Gymnasium"},
                        {
                          "display": "Kids Play Area",
                          "value": "Kids Play Area"
                        },
                        {"display": "Power Back Up", "value": "Power Back Up"},
                        {"display": "Nil", "value": "Nil"},
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      initialValue: _amentiesValues,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _amentiesValues = value;
                        });
                      },
                    ),
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
                    MultiSelectFormField(
                      border: OutlineInputBorder(),
                      title: Text('Construction Type'),
                      dataSource: [
                        {
                          "display": "RCC Frame Structure",
                          "value": "RCC Frame Structure"
                        },
                        {
                          "display": "Load Bearing Structure",
                          "value": "Load Bearing Structure"
                        },
                        {
                          "display": "Old Stone Masonry Buildings",
                          "value": "Old Stone Masonry Buildings"
                        },
                        {
                          "display": "Composite (RCC & Load Bearing) Structure",
                          "value": "Composite (RCC & Load Bearing) Structure"
                        },
                        {
                          "display": "Industrial Shed",
                          "value": "Industrial Shed"
                        },
                        {
                          "display":
                              "Pre Fabricated Engineering Building ( PEB Structures )",
                          "value":
                              "Pre Fabricated Engineering Building ( PEB Structures )"
                        },
                        {"display": "Vacant Plot", "value": "Vacant Plot"},
                        {
                          "display": "MS Steel Structure with AC Sheet Roofing",
                          "value": "MS Steel Structure with AC Sheet Roofing"
                        },
                        {
                          "display":
                              "MS Steel Structure with AC Sheet Roofing & RCC Columns",
                          "value":
                              "MS Steel Structure with AC Sheet Roofing & RCC Columns"
                        },
                        {
                          "display":
                              "RCC Frame Structure; Steel Truss and Part MS Sheet Roofing",
                          "value":
                              "RCC Frame Structure; Steel Truss and Part MS Sheet Roofing"
                        },
                        {
                          "display":
                              "Internal Visit not Allowed hence Cannot Comment",
                          "value":
                              "Internal Visit not Allowed hence Cannot Comment"
                        },
                        {
                          "display": "Ms Streel Structure",
                          "value": "Ms Streel Structure"
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      initialValue: _constructionTypeValues,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _constructionTypeValues = value;
                        });
                      },
                    ),
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
                    MultiSelectFormField(
                      border: OutlineInputBorder(),
                      title: Text('Construction Type'),
                      dataSource: [
                        {
                          "display": "Marble Flooring",
                          "value": "Marble Flooring"
                        },
                        {
                          "display": "Vitrified Flooring",
                          "value": "Vitrified Flooring"
                        },
                        {"display": "Kota Stone", "value": "Kota Stone"},
                        {"display": "Poor", "value": "Poor"},
                        {
                          "display": "Italian Marble",
                          "value": "Italian Marble"
                        },
                        {"display": "Ceramic Tiles", "value": "Ceramic Tiles"},
                        {
                          "display": "Granite Flooring",
                          "value": "Granite Flooring"
                        },
                        {
                          "display": "Mosaic Flooring",
                          "value": "Mosaic Flooring"
                        },
                        {
                          "display": "Wooden Flooring",
                          "value": "Wooden Flooring"
                        },
                        {"display": "PCC", "value": "PCC"},
                        {
                          "display": "Bare shell Unit hence not applicable",
                          "value": "Bare shell Unit hence not applicable"
                        },
                        {
                          "display":
                              "Internal Visit not Allowed hence Cannot Comment",
                          "value":
                              "Internal Visit not Allowed hence Cannot Comment"
                        },
                        {
                          "display": "Carpet Laid on Flooring",
                          "value": "Carpet Laid on Flooring"
                        },
                        {
                          "display": "Under Construction",
                          "value": "Under Construction"
                        },
                        {"display": "NA", "value": "NA"},
                        {
                          "display": "Not Applicable as property is plot",
                          "value": "Not Applicable as property is plot"
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      initialValue: _flooringValues,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _flooringValues = value;
                        });
                      },
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(mainText: "Engineer Remark"),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.green,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(controller: _remark)
                  ],
                ),
              ),
            ),
      bottomNavigationBar: GestureDetector(
        child: NavigatorConatiner(),
        onTap: () async {
          try {
            if (_yearOfConstruction.text.isEmpty) {
              // Show an error message if the landmark field is empty
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Please provide a value for the Year of construction field.'),
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
                builder: (context) => CaseStatusScreen(),
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
            _physicalstatusController.clear();
            _pecentageController.clear();
            _propertyType.clear();
            _propertyUsage.clear();
            _indipendentUit.clear();
            _remarkviewProperty.clear();
            _perflooraAndPositionUnit.clear();
            _accomendationUnit.clear();
            _wingsINSoceiety.clear();
            _numberOfStoyires.clear();
            _exterior.clear();
            _interior.clear();
            _fitting.clear();
            _flooring.clear();
            _window.clear();
            _door.clear();
            _propertyAge.clear();
            _maintainceLevel.clear();
            _selctConstructionPlan.clear();
            _commercialUsageDetails.clear();
            _entireBldgType.clear();
            _yearOfConstruction.clear();
            _souurondedBy.clear();
            _residualAge.clear();
            _remark.clear();
            _independentacess.clear();
          } catch (e) {
            // Handle error if the update fails
            print("Error updating data: $e");
          }
        },
      ),
    );
  }
}
