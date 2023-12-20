import 'package:flutter/material.dart';

import '../custom_widgets/text_widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
            text: 'History',
            textcolor: Colors.white,
            textsize: 20,
            textweight: FontWeight.w500),
      ),
      body: Center(
        child: Text('History screen'),
      ),
    );
  }
}
