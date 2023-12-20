import 'package:flutter/material.dart';

import '../custom_widgets/text_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              text: 'My Profile',
              textcolor: Colors.white,
              textsize: 20,
              textweight: FontWeight.w500),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: 'First Name',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                        text: 'Last Name',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                        text: 'Mobile Number',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                        text: 'Email',
                        textcolor: Colors.black,
                        textsize: 16,
                        textweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: MediaQuery.sizeOf(context).width,
            color: Color(0xFF38C0CE),
            child: TextWidget(
                text: 'Update Profile',
                textcolor: Colors.white,
                textsize: 18,
                textweight: FontWeight.w500),
          ),
        ));
  }
}
