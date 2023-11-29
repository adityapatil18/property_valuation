import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/Screens/create_account_screen.dart';
import 'package:property_valuation/View/Screens/forget_password_screen.dart';
import 'package:property_valuation/View/Screens/home_screen.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/shared_functions.dart';
import '../../model/enginer_visit_case_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();
  String locationName = "";
  String borrowerName = "";
  String instituteName = "";
  String contactPerson = "";
  String address = "";
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    email = email.trim();
    password = password.trim();
    try {
      Response response = await post(
        Uri.parse('https://apivaluation.techgigs.in/admin/user/islogin'),
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var token = data['data']['token'];

        print('API response: ${response.body}');
        print('Token : $token');
        print('Login successfully');

        await _sharedPreferencesHelper.saveToken(token);
        await saveToken(token);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Login failed. Please check your credentials.')),
        );
        print('Failed');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
      print(e.toString());
    }
  }

  Future<void> saveToken(String token) async {
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
        print('Third API response: ${response.body}');
        var data = responseData['data'];
        print('User ID check : $data');
        final enginerVisitCaseData =
            EnginerVisitCaseData.fromJson(responseData);
        locationName =
            enginerVisitCaseData.data.dataarray[0].locationData[0].name;
        borrowerName = enginerVisitCaseData.data.dataarray[0].borrowerName;
        address = enginerVisitCaseData.data.dataarray[0].addressofProperty;
        DateTime abc =
            enginerVisitCaseData.data.dataarray[0].visitScheduledDate;
        DateTime xyz = enginerVisitCaseData.data.dataarray[0].requestDate;
        print('loaction name:$locationName');
        print('borrower name:$borrowerName');
        print('address:$address');
        print('abc:$abc');
        print('xyz:$xyz');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print(
            'Failed to send userId to the third API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending userId to the third API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                image: DecorationImage(
                    image: AssetImage('images/shine.png'), opacity: 0.2)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('images/MARK.png'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                            text: 'SPIRIT',
                            textcolor: Colors.white,
                            textsize: 30,
                            textweight: FontWeight.w500),
                        TextWidget(
                            text: 'APP',
                            textcolor: Colors.white,
                            textsize: 30,
                            textweight: FontWeight.w100),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 80,
                          color: Color(0xFF38C0CE),
                          child: Image.asset(
                            'images/user (2).png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              color:
                                  Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                              // height: 60,
                              // width: MediaQuery.sizeOf(context).width,
                              child: TextField(
                                controller: _userNameController,
                                decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 5, color: Colors.white))),
                              )),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 80,
                            color: Color(0xFF38C0CE),
                            child: Image.asset(
                              'images/key.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color:
                                  Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 5, color: Colors.white))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            minimumSize:
                                MaterialStateProperty.all(Size(300, 60)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF38C0CE))),
                        onPressed: () {
                          final email = _userNameController.text.toString();
                          final password = _passwordController.text.toString();
                          print('Email: $email, Password: $password');

                          if (email.isNotEmpty && password.isNotEmpty) {
                            setState(() {
                              login(email, password);
                            });
                          } else {
                            // Show an error message if fields are empty
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Please fill in both fields.')),
                            );
                          }
                        },
                        child: TextWidget(
                            text: 'Sign In',
                            textcolor: Colors.white,
                            textsize: 18,
                            textweight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ForgetPasswordScreen()));
                      },
                      child: TextWidget(
                          text: 'Forget your password?',
                          textcolor: Colors.white,
                          textsize: 16,
                          textweight: FontWeight.w300),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
