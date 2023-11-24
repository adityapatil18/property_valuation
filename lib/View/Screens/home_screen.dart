import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/about_us_screen.dart';
import 'package:property_valuation/View/Screens/attendance_screen.dart';
import 'package:property_valuation/View/Screens/contact_us_screen.dart';
import 'package:property_valuation/View/Screens/history_screen.dart';
import 'package:property_valuation/View/Screens/policy_screen.dart';
import 'package:property_valuation/View/Screens/profile_screen.dart';
import 'package:property_valuation/View/Screens/reimbustment_screen.dart';
import 'package:property_valuation/View/Screens/upadate_password_screen.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String hexColor = "333a49";
    // Color color = Color(int.parse("0xFF$hexColor"));

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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => AboutUsScreen()));
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
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
                        bottom: BorderSide(color: Colors.white),
                        top: BorderSide(color: Colors.white))),
                child: ListTile(
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: Icon(
                    Icons.policy,
                    color: Colors.white,
                  ),
                  title: TextWidget(
                      text: 'Policy',
                      textcolor: Colors.white,
                      textsize: 14,
                      textweight: FontWeight.w500),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => PolicyScreen()));
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white),
                )),
                child: ListTile(
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
                              onPressed: () {},
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
                              onPressed: () {},
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
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: Image.asset(
                                'images/monthly.png',
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
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
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: Image.asset(
                                'images/caase.png',
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
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
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: Image.asset(
                                'images/visit.png',
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
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
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: Image.asset(
                                'images/monthly.png',
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
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
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: Image.asset(
                                'images/caase.png',
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
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
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                              child: Image.asset(
                                'images/visit.png',
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
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
                ],
              ),
            )
          ],
        ));
  }
}
