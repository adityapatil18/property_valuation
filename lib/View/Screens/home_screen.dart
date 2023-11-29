import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/Screens/about_us_screen.dart';
import 'package:property_valuation/View/Screens/attendance_screen.dart';
import 'package:property_valuation/View/Screens/contact_us_screen.dart';
import 'package:property_valuation/View/Screens/history_screen.dart';
import 'package:property_valuation/View/Screens/login_screen.dart';
import 'package:property_valuation/View/Screens/policy_screen.dart';
import 'package:property_valuation/View/Screens/profile_screen.dart';
import 'package:property_valuation/View/Screens/reimbustment_screen.dart';
import 'package:property_valuation/View/Screens/tech_initiation_screen.dart';
import 'package:property_valuation/View/Screens/upadate_password_screen.dart';
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

  Future<void> fetchData() async {
    try {
      // Retrieve the token from shared preferences
      String? token = await _sharedPreferencesHelper.getToken();

      if (token != null) {
        // Token is available, proceed with fetching additional data
        String? userId = await saveToken(token);
        await enginerVisitCaseList(userId!);
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
      await _sharedPreferencesHelper.getUserId(userId);

      Response response = await post(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/get-EngineerVisitCase_list"),
          body: {"page": "1", "limit": "2", "search": "", "userID": userId});
      if (response.statusCode == 200) {
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
    fetchData();
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
        backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),

          // backgroundColor: Colors.grey.shade200,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      'images/profile2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(1, 66, 75, 95).withOpacity(1)),
                accountName: TextWidget(
                    text: 'TechGigs',
                    textcolor: Colors.white,
                    textsize: 18,
                    textweight: FontWeight.w500),
                accountEmail: Text('TechGigs@gmail.com'),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'Home',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    // Handle the tap on Home
                    Navigator.pop(context); // Close the drawer
                    // Add your navigation logic here
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'History',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryScreen()));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Container(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      'images/attendance.png',
                      color: Colors.white,
                    ),
                  ),
                  title: TextWidget(
                      text: 'Attendance',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: TextWidget(
                            text: 'Attendance',
                            textcolor: Colors.black,
                            textsize: 20,
                            textweight: FontWeight.w500),
                        // content: TextWidget(
                        //     text: 'Are you sure you want to logout?',
                        //     textcolor: Colors.black,
                        //     textsize: 16,
                        //     textweight: FontWeight.w400),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(1),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(50, 30)),
                                  backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF38C0CE),
                                  )),
                              onPressed: () {},
                              child: TextWidget(
                                  text: 'CHECK IN',
                                  textcolor: Colors.white,
                                  textsize: 12,
                                  textweight: FontWeight.w500)),
                          ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(1),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(50, 30)),
                                  backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF38C0CE),
                                  )),
                              onPressed: () {},
                              child: TextWidget(
                                  text: 'CHECK OUT',
                                  textcolor: Colors.white,
                                  textsize: 12,
                                  textweight: FontWeight.w500))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Container(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      'images/reim.png',
                      color: Colors.white,
                    ),
                  ),
                  title: TextWidget(
                      text: 'Reimbursement',
                      textcolor: Colors.white,
                      textsize: 13.5,
                      textweight: FontWeight.w500),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReimbustmentScreen()));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'Profile',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Image.asset(
                    'images/about.png',
                    height: 22,
                    width: 22,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'About Us',
                      textcolor: Colors.white,
                      textsize: 12,
                      textweight: FontWeight.w500),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUsScreen()));
                  },
                ),
              ),
              ListTile(
                splashColor: Color(0xFF38C0CE),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                leading: Image.asset(
                  'images/contact.png',
                  height: 22,
                  width: 22,
                  color: Colors.white,
                ),
                title: TextWidget(
                    text: 'Contact Us',
                    textcolor: Colors.white,
                    textsize: 12.5,
                    textweight: FontWeight.w500),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactUsScreen()));
                },
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.white),
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'Update Password',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdatePasswordScreen()));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
                  splashColor: Color(0xFF38C0CE),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'Logout',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: TextWidget(
                            text: 'Logout',
                            textcolor: Colors.black,
                            textsize: 20,
                            textweight: FontWeight.w500),
                        content: TextWidget(
                            text: 'Are you sure you want to logout?',
                            textcolor: Colors.black,
                            textsize: 16,
                            textweight: FontWeight.w400),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(1),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(50, 30)),
                                  backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF38C0CE),
                                  )),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: TextWidget(
                                  text: 'No',
                                  textcolor: Colors.white,
                                  textsize: 12,
                                  textweight: FontWeight.w500)),
                          ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(1),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(50, 30)),
                                  backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF38C0CE),
                                  )),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: TextWidget(
                                  text: 'Yes',
                                  textcolor: Colors.white,
                                  textsize: 12,
                                  textweight: FontWeight.w500))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                  image: DecorationImage(
                      image: AssetImage('images/shine.png'),
                      fit: BoxFit.cover,
                      opacity: 0.2)),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: TextWidget(
                                  text: '0',
                                  textcolor: Colors.white,
                                  textsize: 20,
                                  textweight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Monthly Alloc.',
                              textcolor: Colors.white,
                              textsize: 14,
                              textweight: FontWeight.w500)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: TextWidget(
                                  text: '0',
                                  textcolor: Colors.white,
                                  textsize: 20,
                                  textweight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Case Done',
                              textcolor: Colors.white,
                              textsize: 14,
                              textweight: FontWeight.w500)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: TextWidget(
                                  text: '0',
                                  textcolor: Colors.white,
                                  textsize: 20,
                                  textweight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Total Visit Done',
                              textcolor: Colors.white,
                              textsize: 14,
                              textweight: FontWeight.w500)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: TextWidget(
                                  text: '0',
                                  textcolor: Colors.white,
                                  textsize: 20,
                                  textweight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: "Today's Alloc.",
                              textcolor: Colors.white,
                              textsize: 14,
                              textweight: FontWeight.w500)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: TextWidget(
                                  text: '0',
                                  textcolor: Colors.white,
                                  textsize: 20,
                                  textweight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Spill Cases',
                              textcolor: Colors.white,
                              textsize: 14,
                              textweight: FontWeight.w500)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: TextWidget(
                                  text: '0',
                                  textcolor: Colors.white,
                                  textsize: 20,
                                  textweight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Tomorrow Alloc.',
                              textcolor: Colors.white,
                              textsize: 14,
                              textweight: FontWeight.w500)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.sizeOf(context).width,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                    ),
                                    TextWidget(
                                        text: 'LP-8',
                                        textcolor: Colors.white,
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
                                        color: Colors.white,
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
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          TextWidget(
                              text: 'Location Name:$locationName',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Borrower Name:$borrowerName',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Institute Name:$instituteName',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Contact Person:',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Address:$address',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Date of visit:$dateOfVisit',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Date of Reschedule:$dateOfReschedule',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          TextWidget(
                              text: 'Special Instruction:',
                              textcolor: Colors.white,
                              textsize: 15,
                              textweight: FontWeight.w500),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.white)),
                                child: TextWidget(
                                    text: 'Case Status Update',
                                    textcolor: Colors.white,
                                    textsize: 12,
                                    textweight: FontWeight.w500),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.white)),
                                child: TextWidget(
                                    text: 'Schedule',
                                    textcolor: Colors.white,
                                    textsize: 12,
                                    textweight: FontWeight.w500),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.white)),
                                child: TextWidget(
                                    text: 'Call',
                                    textcolor: Colors.white,
                                    textsize: 12,
                                    textweight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
