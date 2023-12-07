import 'package:flutter/material.dart';

import '../Screens/about_us_screen.dart';
import '../Screens/contact_us_screen.dart';
import '../Screens/history_screen.dart';
import '../Screens/login_screen.dart';
import '../Screens/profile_screen.dart';
import '../Screens/reimbustment_screen.dart';
import '../Screens/upadate_password_screen.dart';
import 'text_widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()));
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
                                      borderRadius: BorderRadius.circular(5))),
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
                                      borderRadius: BorderRadius.circular(5))),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsScreen()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()));
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
                                      borderRadius: BorderRadius.circular(5))),
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
                                      borderRadius: BorderRadius.circular(5))),
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
    );
  }
}
