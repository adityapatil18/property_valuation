import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/case_status_screen.dart';
import 'package:property_valuation/View/Screens/images_screen.dart';
import 'package:property_valuation/View/Screens/mm_sheets_screen.dart';
import 'package:property_valuation/View/Screens/physical_inspection1_screen1.dart';
import 'package:property_valuation/View/Screens/physical_inspection2_screen2.dart';
import 'package:property_valuation/View/custom_widgets/popup_menu.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';

import '../custom_widgets/text_widgets.dart';

class TechInitiationScreen extends StatefulWidget {
  const TechInitiationScreen({super.key});

  @override
  State<TechInitiationScreen> createState() => _TechInitiationScreenState();
}

class _TechInitiationScreenState extends State<TechInitiationScreen> {
  TextEditingController _instituteType = TextEditingController();
  TextEditingController _instituteName = TextEditingController();
  TextEditingController __insituteBranch = TextEditingController();
  TextEditingController _dateofrequest = TextEditingController();
  TextEditingController _dateofvisit = TextEditingController();
  TextEditingController _nameOfApplicant = TextEditingController();
  TextEditingController _nameofPerson = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _filerefNo = TextEditingController();
  TextEditingController _cas = TextEditingController();
  TextEditingController _addressRequest = TextEditingController();
  TextEditingController _addressInspection = TextEditingController();
  TextEditingController _loanType = TextEditingController();
  TextEditingController _cts = TextEditingController();
  TextEditingController _wardName = TextEditingController();
  TextEditingController _flatNo = TextEditingController();
  TextEditingController _floor = TextEditingController();
  TextEditingController _socity = TextEditingController();
  TextEditingController _plotNo = TextEditingController();
  TextEditingController _sectorColony = TextEditingController();
  TextEditingController _road = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _district = TextEditingController();
  TextEditingController _landmark = TextEditingController();
  TextEditingController _pincode = TextEditingController();
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
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFF38C0CE),
          centerTitle: true,
          title: TextWidget(
              text: 'Tech Initiation',
              textcolor: Colors.black,
              textsize: 20,
              textweight: FontWeight.w500),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
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
                CustomRichText(mainText: 'Insitute Type'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _instituteType),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Insitute Name'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _instituteName),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Insitute Branch'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: __insituteBranch),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Date of Request'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _dateofrequest),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Date of Visit'),
                CustomTextField(controller: _dateofvisit),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFF38C0CE),
                ),
                TextWidget(
                    text: 'GENERAL DETAILS',
                    textcolor: Colors.black,
                    textsize: 18,
                    textweight: FontWeight.w500),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Name of the Applicant'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _nameOfApplicant),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Name of contact person'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _nameofPerson),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Mobile Number'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _mobileNumber),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'File Ref Number'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _filerefNo),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'CAS No'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _cas),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(
                    mainText: 'Address of the Property(As per request)'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _addressRequest),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(
                    mainText: 'Adddressof the property(As per Inspection)'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _addressInspection),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Loan type/Product'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _loanType),
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
                CustomRichText(mainText: 'CTS/Survey No & Village'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _cts),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Ward Name/No.'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _wardName),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Flat No./Unit No.'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _flatNo),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Floor,Wing'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _floor),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Socity/Building name'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _socity),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Plot No.'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _plotNo),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Sector/Colony/Locality'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _sectorColony),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Road/other'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _road),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(
                  mainText: 'Location',
                  isRequired: true,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _location),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'City'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _city),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'District'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _district),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(
                  mainText: 'Landmark',
                  isRequired: true,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _landmark),
                SizedBox(
                  height: 10,
                ),
                CustomRichText(mainText: 'Pincode'),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(controller: _pincode),
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
                textcolor: Colors.black,
                textsize: 18,
                textweight: FontWeight.w500),
          ),
          onTap: () {},
        ));
  }
}
