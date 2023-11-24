import 'package:flutter/material.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF38C0CE),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: TextWidget(
            text: 'Update Password',
            textcolor: Colors.white,
            textsize: 20,
            textweight: FontWeight.w500),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: 'Current Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    children: [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                ])),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    text: 'New Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    children: [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                ])),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    text: 'Re-Enter New Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    children: [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                ])),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ],
        ),
      ),
    );
  }
}
