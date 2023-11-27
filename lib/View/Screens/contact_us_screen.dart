import 'package:flutter/material.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
            text: 'Contact Us',
            textcolor: Colors.white,
            textsize: 20,
            textweight: FontWeight.w500),
      ),
      backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
      body: Column(
        children: [
          Image.asset(
            'images/contac.png',
            height: 400,
            width: 400,
          ),
          Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.white),
                      bottom: BorderSide(color: Colors.white))),
              width: MediaQuery.sizeOf(context).width,
              child: ListTile(
                leading: TextWidget(
                    text: 'Mobile : +91 702 800 7642',
                    textcolor: Colors.white,
                    textsize: 18,
                    textweight: FontWeight.w500),
                trailing: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 25,
                ),
              )),
          Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white))),
              width: MediaQuery.sizeOf(context).width,
              child: ListTile(
                leading: TextWidget(
                    text: 'Email  : TechGigs@gmail.com',
                    textcolor: Colors.white,
                    textsize: 18,
                    textweight: FontWeight.w500),
                trailing: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 25,
                ),
              )),
          Container(
            height: 100,
            decoration: BoxDecoration(
                // border: Border(bottom: BorderSide(color: Colors.white))
                ),
            width: MediaQuery.sizeOf(context).width,
            child: ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.white,
                size: 50,
              ),
              title: Flexible(
                child: Text(
                  'No: 19,20,21, 4th Floor, Suvarna Commercial Complex, Karve Rd, Kothrud, Pune, Maharashtra 411038',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
