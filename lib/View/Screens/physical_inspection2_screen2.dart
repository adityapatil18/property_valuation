import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/images_screen.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'case_status_screen.dart';
import 'home_screen.dart';
import 'mm_sheets_screen.dart';
import 'physical_inspection1_screen1.dart';
import 'tech_initiation_screen.dart';

class PhysicalInspection2Screen2 extends StatefulWidget {
  const PhysicalInspection2Screen2({super.key});

  @override
  State<PhysicalInspection2Screen2> createState() =>
      _PhysicalInspection2Screen2State();
}

class _PhysicalInspection2Screen2State
    extends State<PhysicalInspection2Screen2> {
  List<String> physicalstatusOptions = [];
  TextEditingController _physicalstatusController = TextEditingController();
  TextEditingController _pecentageController = TextEditingController();
  TextEditingController _propertyType = TextEditingController();
  TextEditingController _propertyUsage = TextEditingController();
  TextEditingController _voilationObserved = TextEditingController();
  TextEditingController _indipendentUit = TextEditingController();
  TextEditingController _remarkviewProperty = TextEditingController();
  TextEditingController _perflooraAndPositionUnit = TextEditingController();
  TextEditingController _amentiesAvailable = TextEditingController();
  TextEditingController _accomendationUnit = TextEditingController();
  TextEditingController _wingsINSoceiety = TextEditingController();
  TextEditingController _constructionType = TextEditingController();
  TextEditingController _numberOfStoyires = TextEditingController();
  TextEditingController _numberofLifts = TextEditingController();
  TextEditingController _exterior = TextEditingController();
  TextEditingController _interior = TextEditingController();
  TextEditingController _fitting = TextEditingController();
  TextEditingController _flooring = TextEditingController();
  TextEditingController _window = TextEditingController();
  TextEditingController _door = TextEditingController();
  TextEditingController _propertyAge = TextEditingController();
  TextEditingController _maintainceLevel = TextEditingController();
  TextEditingController _popertyACCValue = TextEditingController();
  TextEditingController _independentacess = TextEditingController();
  TextEditingController _selctConstructionPlan = TextEditingController();
  TextEditingController _commercialUsageDetails = TextEditingController();
  TextEditingController _entireBldgType = TextEditingController();
  TextEditingController _yearOfConstruction = TextEditingController();
  TextEditingController _souurondedBy = TextEditingController();
  TextEditingController _residualAge = TextEditingController();
  TextEditingController _remark = TextEditingController();
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
        // centerTitle: true,
        title: TextWidget(
            text: 'Physical Inspection Two',
            textcolor: Colors.white,
            textsize: 18,
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
              TextWidget(
                  text: 'DETAIL OF PROPERTY LOCATION',
                  textcolor: Colors.black,
                  textsize: 16,
                  textweight: FontWeight.w700),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Physical Status of project',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _physicalstatusController,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Percentage of construction',
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _pecentageController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Type of Property',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _propertyType, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Property usage',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _propertyUsage, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Voilation Observed',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _voilationObserved,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Floor No in case of independent unit',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _indipendentUit),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Remark on view from property',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _remarkviewProperty,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of units per floor and position of unit',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _perflooraAndPositionUnit),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Amenities Available in Socity',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _amentiesAvailable,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Accmodation of unit',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _accomendationUnit),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of wings in society',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _wingsINSoceiety, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Construction type',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _constructionType,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of storyes',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _numberOfStoyires),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'No of lifts',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _numberofLifts, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Exterior',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _exterior, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Interior',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _interior, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Fitting',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _fitting, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Flooring',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _flooring, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Window',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _window, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Door',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _door, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Property Age',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _propertyAge),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Mainataince level of society/project',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _maintainceLevel, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Property_acc_value_HDFC',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _popertyACCValue, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText:
                    'Is there poperty an independent unit has independent access',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _independentacess,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Select Construction as per plan',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _selctConstructionPlan,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Details of commercial usage',
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _commercialUsageDetails,
                  options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Type of entire bldg',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomSelectionTextField(
                  controller: _entireBldgType, options: physicalstatusOptions),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Year of construction',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _yearOfConstruction),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText:
                    'Wheather surrounded by Mosques,Temples,Burning ghat,Cermatorium,etc.',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _souurondedBy),
              SizedBox(
                height: 10,
              ),
              CustomRichText(
                mainText: 'Rsidual Age',
                isRequired: true,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(controller: _residualAge),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF38C0CE),
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget(
                  text: 'VALUATION OBSERVATIONS',
                  textcolor: Colors.black,
                  textsize: 18,
                  textweight: FontWeight.w700),
              SizedBox(
                height: 10,
              ),
              CustomTextField(controller: _remark)
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
