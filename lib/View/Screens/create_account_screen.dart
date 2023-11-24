import 'package:flutter/material.dart';

import '../custom_widgets/text_widgets.dart';

class CreateAcoountScreen extends StatelessWidget {
  const CreateAcoountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            children: [
              Container(
                height: 134,
                width: 134,
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
                      textsize: 40,
                      textweight: FontWeight.w500),
                  TextWidget(
                      text: 'APP',
                      textcolor: Colors.white,
                      textsize: 40,
                      textweight: FontWeight.w100),
                ],
              ),
              SizedBox(
                height: 40,
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
                        'images/user (2).png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                      height: 60,
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 5, color: Colors.white))),
                      ),
                    )
                  ],
                ),
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
                    Container(
                      color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                      height: 60,
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 5, color: Colors.white))),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 30,
                      ),
                      // child: Image.asset(
                      //   'images/key.png',
                      //   height: 30,
                      //   width: 30,
                      // ),
                    ),
                    Container(
                      color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                      height: 60,
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 5, color: Colors.white))),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                      child: Icon(
                        Icons.tablet_android,
                        color: Colors.white,
                        size: 30,
                      ),
                      // child: Image.asset(
                      //   'images/key.png',
                      //   height: 30,
                      //   width: 30,
                      // ),
                    ),
                    Container(
                      color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                      height: 60,
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 5, color: Colors.white))),
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
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      minimumSize: MaterialStateProperty.all(Size(300, 60)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF38C0CE))),
                  onPressed: () {},
                  child: TextWidget(
                      text: 'Create Account',
                      textcolor: Colors.white,
                      textsize: 18,
                      textweight: FontWeight.w700)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
