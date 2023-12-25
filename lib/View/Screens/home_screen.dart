import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:property_valuation/View/Screens/tech_initiation_screen.dart';
import 'package:property_valuation/View/custom_widgets/custom_circle_container.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/my_drawer.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';
import 'package:property_valuation/constant/list_of_options.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/shared_functions.dart';
import '../../model/enginer_visit_case_model.dart';
import '../../model/live_visit_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();
  String locationName = "";
  String borrowerName = "";
  String instituteName = "";
  String contactPerson = "";
  String mobileNumber = "";
  String mobileNumber1 = "";

  String mobileNumber2 = "";
  String mobileNumber3 = "";
  String landLineNumber1 = '';
  String landLineNumber2 = '';
  String appid = '';

  // String _id = "";
  String address = "";
  String abc = '';
  DateTime? dateOfVisit;
  DateTime? dateOfReschedule;
  String specialInstruction = "";
  bool _isLoading = true;
  List<String> statusOption = statusOptions;
  String selectedCaseStatus = "";
  TextEditingController _caseStaus = TextEditingController();
  TextEditingController _selectedDateTimewithCase = TextEditingController();
  Future<void> fetchData() async {
    try {
      // Retrieve the token from shared preferences
      String? token = await _sharedPreferencesHelper.getToken();

      if (token != null) {
        print('step 2');

        // Token is available, proceed with fetching additional data
        String? userId = await saveToken(token);
        print('uid1:$userId');

        await enginerVisitCaseList(userId!);
        print('uid:$userId');
        setState(() {
          _isLoading = false;
        });
      } else {
        print('Token not available.');
        // Handle the case where the token is not available
      }
    } catch (e) {
      print('Error in fetchData: $e');
      // Handle the error according to your application's requirements
    }
  }

  // Future<void> fetchData2() async {
  //   try {
  //     // Ensure you have the userId before calling enginerVisitCaseList
  //     String? userId = await _sharedPreferencesHelper.getUserId();
  //     if (userId != null) {
  //       final String? _id = await enginerVisitCaseList2(userId);

  //       if (_id != null) {
  //         await liveVisitbyId(_id);
  //         print("live vist $_id");
  //       }
  //     } else {
  //       print('User ID is null');
  //     }
  //   } catch (e) {
  //     print('Error in fetchData: $e');
  //     // Handle errors
  //   }
  // }

  Future<String?> saveToken(String token) async {
    try {
      Response response2 = await post(
          Uri.parse("https://apivaluation.techgigs.in/admin/user/getuserlogin"),
          body: {"token": token});
      if (response2.statusCode == 200) {
        var responseData = jsonDecode(response2.body);
        print('Second API response: ${response2.body}');
        // Process the response from the second API if needed
        // Extracting user ID from the response
        var userId = responseData['data']['id'];
        print('User ID: $userId');

        // Saving the user ID to SharedPreferences
        await _sharedPreferencesHelper.saveUserId(userId);
        await enginerVisitCaseList(userId);

        return userId;
      } else {
        print(
            'Failed to send token to the second API. Status code: ${response2.statusCode}');
      }
    } catch (e) {
      print('Error sending token to the second API: $e');
    }
  }

  Future<void> enginerVisitCaseList(String userId) async {
    try {
      print('step3');
      print('userid:$userId');

      Response response = await post(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/get-EngineerVisitCase_list"),
          body: {"page": "1", "limit": "1", "search": "", "userID": userId});
      if (response.statusCode == 200) {
        print('step 4');

        var responseData = jsonDecode(response.body);
        final enginerVisitCaseData =
            EnginerVisitCaseData.fromJson(responseData);

        setState(() {
          // final ids = enginerVisitCaseData.data.dataarray[0].id;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => TechInitiationScreen(),
          //     ));
          locationName =
              enginerVisitCaseData.data.dataarray[0].locationData[0].name;
          borrowerName = enginerVisitCaseData.data.dataarray[0].borrowerName;
          address = enginerVisitCaseData.data.dataarray[0].addressofProperty;
          instituteName = enginerVisitCaseData
              .data.dataarray[0].manageInstitute[0].maininstitutiondata[0].name;
          dateOfVisit =
              enginerVisitCaseData.data.dataarray[0].visitScheduledDate;
          // final abc = dateOfVisit!.toLocal().toString().substring(0, 10);
          mobileNumber = enginerVisitCaseData.data.dataarray[0].mobileNo1;
          print('abc:$abc');
          dateOfReschedule = enginerVisitCaseData.data.dataarray[0].requestDate;
          appid = enginerVisitCaseData.data.dataarray[0].appId;
          // specialInstruction=enginerVisitCaseData.data.dataarray[0].
          print('Data updated successfully');
        });
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

  // Future<String?> enginerVisitCaseList2(String userId) async {
  //   try {
  //     Response response = await post(
  //         Uri.parse(
  //             "https://apivaluation.techgigs.in/admin/livevisit/get-EngineerVisitCase_list"),
  //         body: {"page": "1", "limit": "2", "search": "", "userID": userId});
  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body);
  //       final enginerVisitCaseData =
  //           EnginerVisitCaseData.fromJson(responseData);
  //       _id = enginerVisitCaseData.data.dataarray[0].id;
  //       print("api respnse for responsedata::${responseData}");
  //       print('_id===>$_id');
  //       await _sharedPreferencesHelper.saveid(_id);

  //       return enginerVisitCaseData.data.dataarray[0].id;
  //     } else {
  //       print(
  //           'Failed to send userId to the third API. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error sending userId to the third API: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('An error occurred while fetching data.'),
  //     ));
  //   }
  // }

  Future<void> liveVisitbyId(String _id) async {
    print("Debug: liveVisitbyId - _id: $_id");

    try {
      Response response = await get(Uri.parse(
          'https://apivaluation.techgigs.in/admin/livevisit/livevisit_byId/$_id'));
      print('liveVisitbyId response status code: ${response.statusCode}');
      print('liveVisitbyId response body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(response.body);
          final liveVisitData = LiveVisitData.fromJson(jsonData);

          print('liveVisitbyId data response: $jsonData');
          print("livevistsidat::$liveVisitData");
          final abcd = liveVisitData.data.mobileNo1;
          mobileNumber1 = liveVisitData.data.mobileNo1!;
          mobileNumber2 = liveVisitData.data.mobileNo2!;
          mobileNumber3 = liveVisitData.data.mobileNo3!;
          landLineNumber1 = liveVisitData.data.landlineNumber1!;
          landLineNumber2 = liveVisitData.data.landlineNumber2!;
          print("abcd:$abcd");
        });
      } else {
        print(
            "Failed to fetch liveVisitbyId. Status code: ${response.statusCode}");
        // Handle the case where the API call is not successful
        // You might want to set default values or show an error message
      }
    } catch (e) {
      print('Error in liveVisitbyId: $e');
      // Handle the error according to your application's requirements
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchData();
      // _initializeData();
      // fetchData2();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF38C0CE),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ));
          }),
          title: Row(
            children: [
              Text(
                'Propval',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Lite 1.0',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.video_call,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: MyDrawer(),
        body: _isLoading
            ? Center(child: LoadingIndicator())
            : RefreshIndicator(
                color: Color(0xFF38C0CE),
                onRefresh: () async {
                  setState(() {
                    print('step1');

                    fetchData();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCricleWidget(
                              labelText: 'Monthly Alloc.',
                              value: '0',
                              containerColor: Color(0xFF38C0CE)),
                          CustomCricleWidget(
                              labelText: 'Case Done',
                              value: '0',
                              containerColor: Colors.amber),
                          CustomCricleWidget(
                              labelText: 'Total Visit Done',
                              value: '0',
                              containerColor: Colors.green),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCricleWidget(
                              labelText: "Today's Alloc.",
                              value: '0',
                              containerColor: Colors.lightBlue),
                          CustomCricleWidget(
                              labelText: 'Spill Cases',
                              value: '0',
                              containerColor: Colors.red),
                          CustomCricleWidget(
                              labelText: 'Tomorrow Alloc.',
                              value: '0',
                              containerColor: Colors.orange)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 320,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.flag,
                                          color: Colors.red,
                                        ),
                                        TextWidget(
                                            text: appid,
                                            textcolor: Color(0xFF38C0CE),
                                            textsize: 14,
                                            textweight: FontWeight.w500)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                                    const ClipboardData(
                                                        text: "LP-8"))
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Copied to your clipboard !')));
                                            });
                                          },
                                          icon: Icon(
                                            Icons.copy,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TechInitiationScreen()));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text: 'Location Name:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Borrower Name:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Institute Name:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Contact Person:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Address:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Date of visit:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Date of Reschedule:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                        TextWidget(
                                            text: 'Special Instruction:',
                                            textcolor: Colors.grey,
                                            textsize: 15,
                                            textweight: FontWeight.w400),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text: '$locationName',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '$borrowerName',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '$instituteName',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '${address}',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text:
                                                '${dateOfVisit?.toLocal().toString().substring(0, 10)}',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text:
                                                '${dateOfReschedule?.toLocal().toString().substring(0, 10)}',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextWidget(
                                          text: 'Case Status Update',
                                          textcolor: Colors.white,
                                          textsize: 12,
                                          textweight: FontWeight.w800),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        showUpdateCaseStatus(context);
                                      });
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.purple),
                                      child: TextWidget(
                                          text: 'Schedule',
                                          textcolor: Colors.white,
                                          textsize: 12,
                                          textweight: FontWeight.w800),
                                    ),
                                    onTap: () {
                                      showschedule(context);
                                      // resetValues();
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 82, 187, 86),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextWidget(
                                        text: 'Call',
                                        textcolor: Colors.white,
                                        textsize: 12,
                                        textweight: FontWeight.w800,
                                      ),
                                    ),
                                    onTap: () {
                                      // Replace 'yourListOfMobileNumbers' with the actual list of mobile numbers
                                      List<String> yourListOfMobileNumbers = [
                                        mobileNumber1,
                                        mobileNumber2,
                                        mobileNumber3,
                                        landLineNumber1,
                                        landLineNumber2,
                                      ];
                                      _makePhoneCall(yourListOfMobileNumbers);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }

  void _makePhoneCall(List<String> mobileNumbers) async {
    // Show dialog with the list of phone numbers
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Phone Number'),
          content: Container(
            height: 400,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                for (String number in mobileNumbers)
                  ListTile(
                    trailing: number.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              // Make the phone call
                              _launchPhoneCall(number);
                            },
                            child: Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                          )
                        : null, // Set to null if number is empty
                    title: Text(number),
                    onTap: () {
                      // Close the dialog and make the phone call
                      Navigator.pop(context);
                      if (number.isNotEmpty) {
                        _launchPhoneCall(number);
                      }
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _launchPhoneCall(String mobileNumber) async {
    // Use 'tel:' scheme for making phone calls
    var url = 'tel:$mobileNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String selectedDateTime = ""; // Variable to store selected date and time

  void showUpdateCaseStatus(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: TextWidget(
                text: "Update Case Status",
                textcolor: Colors.black,
                textsize: 20,
                textweight: FontWeight.w500,
              ),
              actions: [
                CustomDropdownSearch(
                  items: statusOption,
                  selectedItem: selectedCaseStatus,
                  onChanged: (value) async {
                    setState(() {
                      selectedCaseStatus = value!;
                      _caseStaus.text = value;
                    });

                    // Fetch the dynamic date and time based on the selected item
                    final dynamicDateTime = await fetchDynamicDateTime(value!);

                    setState(() {
                      selectedDateTime = dynamicDateTime;
                    });
                  },
                  controller: _caseStaus,
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: "$selectedDateTime-${_caseStaus.text}"),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(100, 30)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF38C0CE)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        resetValues();
                      },
                      child: TextWidget(
                        text: 'UPDATE',
                        textcolor: Colors.white,
                        textsize: 12,
                        textweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(100, 30)),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        resetValues();
                      },
                      child: TextWidget(
                        text: 'CANCEL',
                        textcolor: Colors.white,
                        textsize: 12,
                        textweight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  Future<String> fetchDynamicDateTime(String selectedItem) async {
    // Implement your logic here to fetch dynamic date and time based on the selected item
    // For now, I'm using a simple example of returning the current date and time
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd hh:mm a').format(now);
  }

  void resetValues() {
    selectedDateTime = "";
    // selectedCaseStatus = "";
    _caseStaus.clear();
  }

  void showschedule(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    bool isCallMade = false;
    bool isAppointmentConfirmed = false;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: TextWidget(
                text: "Schedule Date and Time",
                textcolor: Colors.black,
                textsize: 20,
                textweight: FontWeight.w500,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                      TextWidget(
                        text:
                            '${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                        textcolor: const Color.fromRGBO(0, 0, 0, 1),
                        textsize: 16,
                        textweight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.access_time),
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                          );
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime = pickedTime;
                            });
                          }
                        },
                      ),
                      TextWidget(
                        text: '${selectedTime.format(context)}',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xFF38C0CE),
                        checkColor: Colors.white,
                        value: isCallMade,
                        onChanged: (value) {
                          setState(() {
                            isCallMade = value ?? false;
                          });
                        },
                      ),
                      TextWidget(
                        text: 'Call Made',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xFF38C0CE),
                        checkColor: Colors.white,
                        value: isAppointmentConfirmed,
                        onChanged: (value) {
                          setState(() {
                            isAppointmentConfirmed = value ?? false;
                          });
                        },
                      ),
                      TextWidget(
                        text: 'Appointment Confirmed',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100, 30)),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF38C0CE)),
                      ),
                      onPressed: () {
                        // Handle the UPDATE action here
                      },
                      child: TextWidget(
                        text: 'UPDATE',
                        textcolor: Colors.white,
                        textsize: 12,
                        textweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100, 30)),
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: TextWidget(
                        text: 'CANCEL',
                        textcolor: Colors.white,
                        textsize: 12,
                        textweight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
