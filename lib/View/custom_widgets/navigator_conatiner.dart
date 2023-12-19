import 'package:flutter/material.dart';

import 'text_widgets.dart';

class NavigatorConatiner extends StatelessWidget {
  const NavigatorConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF38C0CE),
      child: TextWidget(
        text: 'Submit to Propval',
        textcolor: Colors.white,
        textsize: 18,
        textweight: FontWeight.w500,
      ),
    );
  }
}
