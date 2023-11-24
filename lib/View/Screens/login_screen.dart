import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/create_account_screen.dart';
import 'package:property_valuation/View/Screens/forget_password_screen.dart';
import 'package:property_valuation/View/Screens/home_screen.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
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
                    )
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
