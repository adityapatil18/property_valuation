import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:property_valuation/View/Screens/case_status_screen.dart';
import 'package:property_valuation/View/Screens/images_screen.dart';
import 'package:property_valuation/View/Screens/mm_sheets_screen.dart';
import 'package:property_valuation/View/Screens/physical_inspection1_screen1.dart';
import 'package:property_valuation/View/Screens/physical_inspection2_screen2.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/navigator_conatiner.dart';
import 'package:property_valuation/View/custom_widgets/popup_menu.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';
import 'package:property_valuation/model/live_visit_data_model.dart';

import '../../constant/shared_functions.dart';
import '../../model/enginer_visit_case_model.dart';
import '../../model/loan_type_model.dart';
import '../../model/location_popup_model.dart';
import '../custom_widgets/text_widgets.dart';

class TechInitiationScreen extends StatefulWidget {
  const TechInitiationScreen({super.key});

  @override
  State<TechInitiationScreen> createState() => _TechInitiationScreenState();
}

class _TechInitiationScreenState extends State<TechInitiationScreen> {
  TextEditingController _instituteType = TextEditingController();
  TextEditingController _instituteName = TextEditingController();
  TextEditingController __insituteBranch = TextEditingController();
  TextEditingController _dateofrequest = TextEditingController();
  TextEditingController _dateofvisit = TextEditingController();
  TextEditingController _nameOfApplicant = TextEditingController();
  TextEditingController _nameofPerson = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _filerefNo = TextEditingController();
  TextEditingController _cas = TextEditingController();
  TextEditingController _addressRequest = TextEditingController();
  TextEditingController _addressInspection = TextEditingController();
  TextEditingController _loanType = TextEditingController();
  TextEditingController _cts = TextEditingController();
  TextEditingController _wardName = TextEditingController();
  TextEditingController _flatNo = TextEditingController();
  TextEditingController _floor = TextEditingController();
  TextEditingController _socity = TextEditingController();
  TextEditingController _plotNo = TextEditingController();
  TextEditingController _sectorColony = TextEditingController();
  TextEditingController _road = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _district = TextEditingController();
  TextEditingController _landmark = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  String _id = "";
  String? _landmarkError;

  // List<String> locationOptions = [];
  List<LocationListData> locationOptions = [];
  LocationListData? selectedLocation;
  LoanType? loanTypeData;
  String? loanTypeName;
  bool isLoading = true;

  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();

  Future<void> fetchData() async {
    try {
      // Ensure you have the userId before calling enginerVisitCaseList
      String? userId = await _sharedPreferencesHelper.getUserId();
      if (userId != null) {
        final String? _id = await enginerVisitCaseList(userId);

        if (_id != null) {
          await liveVisitbyId(_id);
          print("live vist $_id");

          // Update UI or perform any other actions based on 'liveVisitbyId' data
          setState(() {
            isLoading = false;
          });
          await updateLiveVisit(_id);
        }
      } else {
        print('User ID is null');
      }
    } catch (e) {
      print('Error in fetchData: $e');
      // Handle errors
    }
  }

  Future<String?> enginerVisitCaseList(String userId) async {
    try {
      Response response = await post(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/get-EngineerVisitCase_list"),
          body: {"page": "1", "limit": "2", "search": "", "userID": userId});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        final enginerVisitCaseData =
            EnginerVisitCaseData.fromJson(responseData);
        _id = enginerVisitCaseData.data.dataarray[0].id;
        print("api respnse for responsedata::${responseData}");
        print('_id===>$_id');
        await _sharedPreferencesHelper.saveid(_id);

        return enginerVisitCaseData.data.dataarray[0].id;
      } else {
        print(
            'Failed to send userId to the third API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending userId to the third API: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred while fetching data.'),
      ));
    }
  }

  Future<void> liveVisitbyId(String _id) async {
    print("Debug: liveVisitbyId - _id: $_id"); // Add this debug print

    try {
      Response response = await get(Uri.parse(
          'https://apivaluation.techgigs.in/admin/livevisit/livevisit_byId/$_id'));
      if (response.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(response.body);
          final liveVisitData = LiveVisitData.fromJson(jsonData);
          print('liveVisitbyId data response: $jsonData');
          print("livevistsidat::$liveVisitData");
          _instituteType.text = liveVisitData.data.institutionType!;
          _instituteName.text = liveVisitData.data.maininstitutionname!;
          __insituteBranch.text = liveVisitData.data.manageInstitutename!;
          String formmatedRequestDate =
              DateFormat('yyyy-MM-dd').format(liveVisitData.data.requestDate);
          _dateofrequest.text = formmatedRequestDate;
          String formmatedVisitDate = DateFormat('yyyy-MM-dd')
              .format(liveVisitData.data.visitScheduledDate);
          _dateofvisit.text = formmatedVisitDate;
          _nameOfApplicant.text = liveVisitData.data.borrowerName!;
          _nameofPerson.text = liveVisitData.data.contactPersonName!;
          _mobileNumber.text = liveVisitData.data.mobileNo1!;
          _filerefNo.text = liveVisitData.data.filerefNo!;
          _cas.text = liveVisitData.data.casNo!;
          _loanType.text = liveVisitData.data.loanType!;

          print(_instituteType.text);
        });
      } else {
        print(
            "Failed to fetch liveVisitbyId. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Errors : $e');
    }
  }

  Future<void> updateLiveVisit(String id) async {
    try {
      String locationId = selectedLocation?.id ?? "";

      Response response = await put(
        Uri.parse(
            "https://apivaluation.techgigs.in/admin/livevisit/update_one_livevisit"),
        body: {
          "id": id,
          "CTSSurveyNo": _cts.text,
          "wardname": _wardName.text,
          "flatUnitNo": _flatNo.text,
          "floorwing": _floor.text,
          "societyName": _socity.text,
          "plotNo": _plotNo.text,
          "sector": _sectorColony.text,
          "roadArea": _road.text,
          "city": _city.text,
          "landmark": _landmark.text,
          "pin": _pincode.text,
          "district": _district.text,
          // "location": _location.text
          "location": locationId,
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // print("API response: $responseData");

        // Check the response and handle accordingly
        if (responseData['status'] == 'LiveVisit updated Successfully') {
          print("Data updated successfully!");
        } else {
          print(
              "Failed to update data. Server response: ${responseData['status']}");
        }
      } else {
        print("Failed to update data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  Future<List<LocationListData>> fetchLocationOptions() async {
    try {
      Response response = await get(
        Uri.parse(
            "https://apivaluation.techgigs.in/admin/location/get-activelocation_list"), // Replace with your API endpoint
        // Include any necessary headers or parameters
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // print("loaction api response:$responseData");
        // final locationPopUpList = LocationPopUpList.fromJson(responseData);
        // List<String> options =
        //     locationPopUpList.data.map((datum) => datum.name).toList();
        LocationPopUpList locationPopUpList =
            LocationPopUpList.fromJson(responseData);
        List<LocationListData> options = locationPopUpList.data;
        print('list of options:$options');
        return options;
      } else {
        print(
            'Failed to fetch location options. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error in fetchLocationOptions: $e');
      return [];
    }
  }

  Future<void> fetchLoanTypeDetails() async {
    try {
      // Assuming you have an API endpoint for fetching loan type details
      Response response = await get(
        Uri.parse(
            "https://apivaluation.techgigs.in/admin/loan/get-loanactive_list"),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        LoanType loanType = LoanType.fromJson(responseData);
        // print('loan api response:$responseData');
        // print("loan type:$loanType");
      } else {
        print(
            'Failed to fetch loan type details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchLoanTypeDetails: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchData();
    });
    fetchLocationOptions().then((options) {
      setState(() {
        locationOptions = options;
        selectedLocation =
            locationOptions.isNotEmpty ? locationOptions[0] : null;
      });
    });

    fetchLoanTypeDetails();
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
          centerTitle: true,
          title: TextWidget(
              text: 'Tech Initiation',
              textcolor: Colors.white,
              textsize: 20,
              textweight: FontWeight.w500),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
        body: isLoading
            ? Center(
                child: LoadingIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichText(mainText: 'Insitute Type'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        enabled: false,
                        controller: _instituteType,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Insitute Name'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        enabled: false,
                        controller: _instituteName,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Insitute Branch'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: __insituteBranch,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(
                        mainText: 'Date of Request',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _dateofrequest,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Date of Visit'),
                      CustomTextField(
                        controller: _dateofvisit,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFF38C0CE),
                      ),
                      TextWidget(
                          text: 'GENERAL DETAILS',
                          textcolor: Colors.black,
                          textsize: 18,
                          textweight: FontWeight.w500),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Name of the Applicant'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _nameOfApplicant,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Name of contact person'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _nameofPerson,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Mobile Number'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _mobileNumber,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'File Ref Number'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _filerefNo,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'CAS No'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _cas,
                        readOnly: true,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(
                          mainText: 'Address of the Property(As per request)'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _addressRequest),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(
                          mainText:
                              'Adddressof the property(As per Inspection)'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _addressInspection),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Loan type/Product'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                          readOnly: true,
                          enabled: false,
                          controller: _loanType),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFF38C0CE),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'CTS/Survey No & Village'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _cts),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Ward Name/No.'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _wardName),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Flat No./Unit No.'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _flatNo),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Floor,Wing'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _floor),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Socity/Building name'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _socity),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Plot No.'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _plotNo),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Sector/Colony/Locality'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _sectorColony),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Road/other'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _road),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(
                        mainText: 'Location',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DropdownSearch<LocationListData>(
                        popupProps: PopupProps.menu(
                          searchDelay: Duration(microseconds: 1),
                          constraints: BoxConstraints.expand(
                              height: MediaQuery.sizeOf(context).height,
                              width: MediaQuery.sizeOf(context).width),
                          searchFieldProps: TextFieldProps(
                            controller: _location,
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
                        compareFn: (LocationListData item,
                                LocationListData selectedItem) =>
                            item.id == selectedItem.id,
                        selectedItem: selectedLocation,
                        itemAsString: (LocationListData item) => '${item.name}',
                        items: locationOptions,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        ),
                        onChanged: (
                          LocationListData? val,
                        ) {
                          setState(() {
                            selectedLocation = val;
                            // Additional logic if needed
                          });
                        },
                        onSaved: (LocationListData? newValue) {
                          setState(() {
                            selectedLocation = newValue;
                            // Additional logic if needed
                          });
                        },
                        validator: (LocationListData? value) {
                          if (value == null || value.name.isEmpty) {
                            return 'Location is required';
                          }
                          return null; // Return null if validation passes
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'City'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _city),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'District'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _district),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(
                        mainText: 'Landmark',
                        isRequired: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        // errortext: _landmarkError,
                        controller: _landmark,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRichText(mainText: 'Pincode'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(controller: _pincode),
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
              if (_landmark.text.isEmpty) {
                // Show an error message if the landmark field is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Please provide a value for the landmark field.'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return; // Exit the method without updating if the landmark field is empty
              }

              await updateLiveVisit(_id);

              // If the update is successful, navigate to the next screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImagesScreen(),
                ),
              );
              // If the update is successful, show a SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Data updated successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );
              _addressRequest.clear();
              _addressInspection.clear();
              _cts.clear();
              _wardName.clear();
              _flatNo.clear();
              _floor.clear();
              _socity.clear();
              _plotNo.clear();
              _sectorColony.clear();
              _road.clear();
              _location.clear();
              _city.clear();
              _district.clear();
              _landmark.clear();
              _pincode.clear();
            } catch (e) {
              // Handle error if the update fails
              print("Error updating data: $e");
            }
          },
        ));
  }
}
