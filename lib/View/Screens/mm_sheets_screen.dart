import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/case_status_screen.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'home_screen.dart';
import 'images_screen.dart';
import 'physical_inspection1_screen1.dart';
import 'physical_inspection2_screen2.dart';
import 'tech_initiation_screen.dart';

class MMSheetsScreen extends StatelessWidget {
  const MMSheetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF38C0CE),
        centerTitle: true,
        title: TextWidget(
            text: 'MM Sheets',
            textcolor: Colors.white,
            textsize: 20,
            textweight: FontWeight.w500),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
          CustomPopupMenuButton(onSelected: (value) {
            switch (value) {
              case 'techInitiation':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TechInitiationScreen()),
                );
                break;
              case 'images':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagesScreen()),
                );
                break;
              case 'mmSheets':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MMSheetsScreen()),
                );
                break;
              case 'physicalInspection1':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhyscialInspection1Screen1()),
                );
                break;
              case 'physicalInspection2':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhysicalInspection2Screen2()),
                );
                break;
              case 'caseStatus':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaseStatusScreen()),
                );
                break;
            }
          })
        ],
      ),
      body: Center(
        child: Text('MM Sheets Screen'),
      ),
    );
  }
}
