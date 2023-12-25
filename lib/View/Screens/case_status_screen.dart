import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/textfield_widget.dart';
import 'package:property_valuation/constant/list_of_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/live_visit_data_model.dart';
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
  String _id = "";
  bool _isLoading = true;
  List<String> statusOption = statusOptions;
  String selctedStatusOption = "";
  DateTime? selectedDateTime;

  Future<void> fetchData() async {
    try {
      if (_id != null) {
        await liveVisitbyId(_id);

        // Update UI or perform any other actions based on 'liveVisitbyId' data
        setState(() {
          _isLoading = false;
        });
      } else {
        print('User ID is null');
      }
    } catch (e) {
      print('Error in fetchData: $e');
      // Handle errors
    }
  }

  Future<void> liveVisitbyId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('2');

    final String? id = prefs.getString("id");
    try {
      Response response = await get(Uri.parse(
          'https://apivaluation.techgigs.in/admin/livevisit/livevisit_byId/$id'));
      if (response.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(response.body);
          final liveVisitData = LiveVisitData.fromJson(jsonData);
          _reception.text = liveVisitData.data.username!;
          _branchOfficer.text = liveVisitData.data.username!;
          _engineer.text = liveVisitData.data.visitAllocatedname!;
          print('liveVisitbyId data response: $jsonData');

          print(_reception.text);
        });
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  Future<void> updateLiveVisit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString("id");
    print("id is:$id");

    try {
      Map<String, dynamic> requestBody = {
        "id": id,
        "status": _status.text,
        "CaseStatus": _caseStatus.text,
      };
      String phsicaljson = jsonEncode(requestBody);
      // requestBody["mmsheet"] = mmsheetJson;
      print("# $phsicaljson");
      Response response = await put(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/update_one_livevisit"),
          headers: {"Content-Type": "application/json"},
          body: phsicaljson);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("API response: ${response.body}");

        print("API response: $responseData");
        print("PUT request successful");
        print("Response status code: ${response.statusCode}");
      } else {
        print("error is :${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error during PUT request: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              print('s');
              Navigator.pop(context);
              print('object');
            });
            print('ss');
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
      body: _isLoading
          ? Center(
              child: LoadingIndicator(),
            )
          : SingleChildScrollView(
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
                    CustomTextField(
                      controller: _reception,
                      readOnly: true,
                      enabled: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Branch Officer',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _branchOfficer,
                      readOnly: true,
                      enabled: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      mainText: 'Engineer',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _engineer,
                      readOnly: true,
                      enabled: false,
                    ),
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
                    CustomDropdownSearch(
                        items: statusOption,
                        selectedItem: selctedStatusOption,
                        onChanged: (value) {
                          setState(() {
                            selctedStatusOption = value!;
                            _status.text = value;
                            selectedDateTime = DateTime.now();
                          });
                        },
                        controller: _status),
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
                      child: TextField(
                        // Display the selected item and its associated date and time
                        controller: TextEditingController(
                          text: selectedDateTime != null
                              ? '$selctedStatusOption - ${_formatDateTime(selectedDateTime!)}'
                              : null,
                        ),
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                        ),
                      ),
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
        onTap: () async {
          try {
            await updateLiveVisit();
            // If the update is successful, show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Data updated successfully!'),
                duration: Duration(seconds: 2),
              ),
            );
            _caseStatus.clear();
            _status.clear();
          } catch (e) {
            print("Error updating data: $e");
          }
        },
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    String period = dateTime.hour >= 12 ? 'PM' : 'AM';
    int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '${dateTime.month}-${dateTime.day}-${dateTime.year} $hour:$minute $period';
  }
}
