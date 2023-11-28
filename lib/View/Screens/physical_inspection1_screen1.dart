import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'case_status_screen.dart';
import 'home_screen.dart';
import 'images_screen.dart';
import 'mm_sheets_screen.dart';
import 'physical_inspection2_screen2.dart';
import 'tech_initiation_screen.dart';

class PhyscialInspection1Screen1 extends StatefulWidget {
  const PhyscialInspection1Screen1({super.key});

  @override
  State<PhyscialInspection1Screen1> createState() =>
      _PhyscialInspection1Screen1State();
}

class _PhyscialInspection1Screen1State
    extends State<PhyscialInspection1Screen1> {
  List<String> options = ['good', 'bad', 'excellent', 'super', 'great'];
  List<String> selectedOptions = [];
  bool _validate = false;
  String? selectedOption;
  List<String> neighborhoodTypeoptionss = [
    "Aristrocrat",
    "Prime Residentaial",
    "Prime Commercial",
    "Prime Industrial",
    "Good Residential",
    "Good Commercial",
    "Good Industrial",
    "Average Residential",
    "Average Commercial",
    "Average Industrial",
    "Red Light Area",
    "Surrounded by Chawl",
    "Below Average Residential",
    "Below Average Commercial",
    "Below Average Industrial",
    "Industrial Commercial"
  ];
  List<String>? filteredOptions;
  TextEditingController _textController = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  void initState() {
    super.initState();

    // filteredOptions = List.from(neighborhoodTypeoptionss);
  }

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
          // centerTitle: true,
          title: TextWidget(
              text: 'Physical Inspection One',
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
                    text: "DETAIL OF PROPERTY LOCATION",
                    textcolor: Colors.white,
                    textsize: 18,
                    textweight: FontWeight.w700),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Infrastructure of the sorrounding area',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: ' *',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ])),
                SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                  dropdownColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                  items: [
                    DropdownMenuItem(
                      value: 'poor',
                      child: Text(
                        'Poor',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'below average',
                      child: Text(
                        'Below Average',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'good',
                      child: Text(
                        'Good',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'very good',
                      child: Text(
                        'Very Good',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'excellent',
                      child: Text(
                        'Excellent',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Select ',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Distance from Landmark/Railway Station',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: ' *',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ])),
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
                RichText(
                    text: TextSpan(
                        text: 'Neighbourhood Type',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: ' *',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ])),
                SizedBox(
                  height: 5,
                ),
                // DropdownButtonFormField(
                //   dropdownColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
                //   items: [
                //     DropdownMenuItem(
                //       value: 'aristrocrat',
                //       child: Text(
                //         'Aristrocrat',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //     DropdownMenuItem(
                //       value: 'prime residential',
                //       child: Text(
                //         'Prime Residential',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //     DropdownMenuItem(
                //       value: 'prime commercial',
                //       child: Text(
                //         'Prime Commercial',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //     DropdownMenuItem(
                //       value: 'prime industrial',
                //       child: Text(
                //         'Prime Industrial',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //     DropdownMenuItem(
                //       value: 'good residential',
                //       child: Text(
                //         'Good Residential',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                //   onChanged: (value) {
                //     setState(() {
                //       selectedOption = value;
                //     });
                //   },
                //   decoration: InputDecoration(
                //       hintText: 'Select ',
                //       hintStyle: TextStyle(color: Colors.white),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide(
                //         color: Colors.white,
                //       ))),
                //   iconEnabledColor: Colors.white,
                //   iconDisabledColor: Colors.white,
                // ),
                TextFormField(
                  controller: _textController,
                  onTap: () {
                    _showOptionsDialog(context);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: 'Select option',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                )
              ],
            ),
          ),
        ));
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      setState(() {
                        _filterOptions(query);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 250,
                  child: ListView.builder(
                    itemCount: filteredOptions!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredOptions![index]),
                        onTap: () {
                          _selectOption(filteredOptions![index]);
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  trailing: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(color: Color(0xFF38C0CE)),
                      )),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
      _textController.text = option;
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  void _filterOptions(String query) {
    query = query.toLowerCase();
    setState(() {
      filteredOptions = neighborhoodTypeoptionss
          .where((option) => option.toLowerCase().contains(query))
          .toList();
    });
  }
}
