import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/case_status_screen.dart';
import 'package:property_valuation/View/Screens/images_screen.dart';
import 'package:property_valuation/View/Screens/mm_sheets_screen.dart';
import 'package:property_valuation/View/Screens/physical_inspection1_screen1.dart';
import 'package:property_valuation/View/Screens/physical_inspection2_screen2.dart';
import 'package:property_valuation/View/custom_widgets/popup_menu.dart';

import '../custom_widgets/text_widgets.dart';

class TechInitiationScreen extends StatelessWidget {
  const TechInitiationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
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
              text: 'Tech Initiation',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    text: 'Institute Type',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Institute Name',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Institute Branch',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Date of request',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Date of visit',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFF38C0CE),
                ),
                TextWidget(
                    text: 'GENERAL DETAILS',
                    textcolor: Colors.white,
                    textsize: 18,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Name of the Applicant',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Name of contact person',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Mobile Number',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'File Ref Number',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'CAS No',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Address of the property(As per request)',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Address of the property(As per Inspection)',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Loan type/Product',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFF38C0CE),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'CTS/Survey No & Village',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Ward Name/No.',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Flat No./Unit No.',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Floor, Wing',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Society/Building Name',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Plot No.',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Sector/Colony/Locality',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Road/Other',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Loan type/Product',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Location',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'City',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'District',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Landmark',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                    text: 'Pincode',
                    textcolor: Colors.white,
                    textsize: 16,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: MediaQuery.sizeOf(context).width,
            color: Color(0xFF38C0CE),
            child: TextWidget(
                text: 'Submit to Propval',
                textcolor: Colors.white,
                textsize: 18,
                textweight: FontWeight.w500),
          ),
          onTap: () {},
        ));
  }
}
