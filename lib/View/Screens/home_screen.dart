import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:property_valuation/View/Screens/tech_initiation_screen.dart';
import 'package:property_valuation/View/custom_widgets/custom_circle_container.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/my_drawer.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

import '../../constant/shared_functions.dart';
import '../../model/enginer_visit_case_model.dart';

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
  String address = "";
  DateTime? dateOfVisit;
  DateTime? dateOfReschedule;
  String specialInstruction = "";
  bool _isLoading = true;

  Future<void> fetchData() async {
    try {
      // Retrieve the token from shared preferences
      String? token = await _sharedPreferencesHelper.getToken();

      if (token != null) {
        print('step 2');

        // Token is available, proceed with fetching additional data
        String? userId = await saveToken(token);
        await enginerVisitCaseList(userId!);
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

      Response response = await post(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/get-EngineerVisitCase_list"),
          body: {"page": "1", "limit": "2", "search": "", "userID": userId});
      if (response.statusCode == 200) {
        print('step 4');

        var responseData = jsonDecode(response.body);
        final enginerVisitCaseData =
            EnginerVisitCaseData.fromJson(responseData);
        setState(() {
          locationName =
              enginerVisitCaseData.data.dataarray[0].locationData[0].name;
          borrowerName = enginerVisitCaseData.data.dataarray[0].borrowerName;
          address = enginerVisitCaseData.data.dataarray[0].addressofProperty;
          instituteName = enginerVisitCaseData
              .data.dataarray[0].manageInstitute[0].maininstitutiondata[0].name;
          dateOfVisit =
              enginerVisitCaseData.data.dataarray[0].visitScheduledDate;
          dateOfReschedule = enginerVisitCaseData.data.dataarray[0].requestDate;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchData();
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
                                            text: 'LP-8',
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
                                          onPressed: () {},
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
                                            text: '$address',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '$dateOfVisit',
                                            textcolor: Colors.black,
                                            textsize: 15,
                                            textweight: FontWeight.w500),
                                        TextWidget(
                                            text: '$dateOfReschedule',
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
                                  Container(
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
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.purple),
                                    child: TextWidget(
                                        text: 'Schedule',
                                        textcolor: Colors.white,
                                        textsize: 12,
                                        textweight: FontWeight.w800),
                                  ),
                                  Container(
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
                                        textweight: FontWeight.w800),
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
}
