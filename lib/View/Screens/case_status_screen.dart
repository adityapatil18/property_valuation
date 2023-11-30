import 'package:flutter/material.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'home_screen.dart';
import 'images_screen.dart';
import 'mm_sheets_screen.dart';
import 'physical_inspection1_screen1.dart';
import 'physical_inspection2_screen2.dart';
import 'tech_initiation_screen.dart';

class CaseStatusScreen extends StatefulWidget {
  const CaseStatusScreen({super.key});

  @override
  State<CaseStatusScreen> createState() => _CaseStatusScreenState();
}

class _CaseStatusScreenState extends State<CaseStatusScreen> {
  TextEditingController _reception = TextEditingController();
  TextEditingController _branchOfficer = TextEditingController();
  TextEditingController _engineer = TextEditingController();
  TextEditingController _status = TextEditingController();
  TextEditingController _caseStatus = TextEditingController();
  List<String> statusOptions = [
    'Visit Done',
    'Visit Failed',
    'Partial Visit Done',
    'Hold Application'
  ];
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
            text: 'Case Status',
            textcolor: Colors.white,
            textsize: 20,
            textweight: FontWeight.w500),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
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
              CustomRichText(
                mainText: 'Reception',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _reception),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Branch Officer',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _branchOfficer),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Engineer',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _engineer),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Status',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _status, options: statusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Case Status',
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                  child: CustomTextField(controller: _caseStatus)),
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
      ),
    );
  }
}
