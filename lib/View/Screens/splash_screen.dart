import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:property_valuation/View/Screens/login_screen.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progressPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(1, 66, 75, 95),
      body: GestureDetector(
        // onTap: () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (_) => LoginScreen()));
        // },
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
              image: DecorationImage(
                  image: AssetImage('images/shine.png'), opacity: 0.1)),
          child: Center(
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
                  height: 20,
                ),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 5000),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      progressPercent = value * 100;
                      return Column(
                        children: [
                          LinearPercentIndicator(
                            width: MediaQuery.sizeOf(context).width,
                            lineHeight: 5,
                            animation: true,
                            animationDuration: 5000,
                            percent: 1,
                            backgroundColor: Color.fromARGB(248, 152, 159, 176),
                            progressColor: Color(0xFF38C0CE),
                            onAnimationEnd: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()),
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          TextWidget(
                            text: '${progressPercent.toInt()}%',
                            textcolor: Colors.white,
                            textsize: 28,
                            textweight: FontWeight.w100,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
