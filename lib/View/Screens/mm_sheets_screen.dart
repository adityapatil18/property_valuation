import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/Screens/case_status_screen.dart';
import 'package:property_valuation/View/custom_widgets/custom_mm_textfield.dart';
import 'package:property_valuation/View/custom_widgets/drop_downsearch_widget.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'home_screen.dart';
import 'images_screen.dart';
import 'physical_inspection1_screen1.dart';
import 'physical_inspection2_screen2.dart';
import 'tech_initiation_screen.dart';

class MMSheetsScreen extends StatefulWidget {
  const MMSheetsScreen({super.key});

  @override
  State<MMSheetsScreen> createState() => _MMSheetsScreenState();
}

class _MMSheetsScreenState extends State<MMSheetsScreen> {
  String selectedOption = "";
  bool _isLoading = true;

  final List<DataRow> _rows = [];
  TextEditingController _groupHead = TextEditingController();
  TextEditingController _area = TextEditingController();
  TextEditingController _sequence = TextEditingController();
  TextEditingController _length = TextEditingController();
  TextEditingController _width = TextEditingController();
  TextEditingController _areaC = TextEditingController();

  List<Map<String, String>> _selectedCategories = [];

  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> updateLiveVisit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('2');

    final String? id = prefs.getString("id");
    print("id is:$id");

    try {
      List<Map<String, dynamic>> rowsData = _rows.map((row) {
        return {
          "grouphead": row.cells[1].child is Text
              ? (row.cells[1].child as Text).data!
              : '',
          "name": row.cells[2].child is Text
              ? (row.cells[2].child as Text).data!
              : '',
          "sequence": row.cells[3].child is Text
              ? (row.cells[3].child as Text).data!
              : '',
          "length": row.cells[4].child is Text
              ? (row.cells[4].child as Text).data!
              : '',
          "width": row.cells[5].child is Text
              ? (row.cells[5].child as Text).data!
              : '',
          "area": row.cells[6].child is Text
              ? (row.cells[6].child as Text).data!
              : '',
        };
      }).toList();

      Map<String, dynamic> requestBody = {
        "id": id,
        "mmsheet": [
          {
            "rows": rowsData,
            "mmsheetType": selectedOption,
            "BalconyTotal": getCategoryTotalArea('Balcony'),
            "CarpetAreaTotal": getCategoryTotalArea('Carpet Area'),
            "OtherAreaTotal": getCategoryTotalArea('Other Area'),
            "RefugeAreaTotal": getCategoryTotalArea('Refuge Area'),
            "TerraceAreaTotal": getCategoryTotalArea('Terrace Area'),
          }
        ]
      };
      // Convert the 'mmsheet' parameter to a JSON-encoded string
      String mmsheetJson = jsonEncode(requestBody);
      // requestBody["mmsheet"] = mmsheetJson;
      print("#s $mmsheetJson");
      Response response = await put(
          Uri.parse(
              "https://apivaluation.techgigs.in/admin/livevisit/update_one_livevisit"),
          headers: {"Content-Type": "application/json"},
          body: mmsheetJson);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("API response: ${response.body}");

        print("API response: $responseData");
        print("PUT request successful");
        print("Response status code: ${response.statusCode}");
        // print("Response body: ${response.body}");
        // Reset text controllers after a successful API call
        _groupHead.text = '';
        _area.text = '';
        _sequence.text = '';
        _length.text = '';
        _width.text = '';
        _areaC.text = '';
      } else {
        print("error is :${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error during PUT request: $e");
    }
  }

  double getCategoryTotalArea(String category) {
    // Calculate the total area for a specific category
    return _selectedCategories
        .where((item) => item['category'] == category)
        .map((item) => double.parse(item['area']!))
        .fold(0, (prev, area) => prev + area);
  }

  Future<void> loadData() async {
    // Simulate loading data from API
    await Future.delayed(Duration(seconds: 2));
    // Set your data loading logic here

    // Simulate loading additional UI data
    await Future.delayed(Duration(seconds: 2));
    // Set your additional UI loading logic here

    // Set _isLoading to false when all data is loaded
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // Call loadData when the state is initialized
    loadData();
  }

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
              text: 'MM Sheets',
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
                      TextWidget(
                          text: 'Area Type',
                          textcolor: Colors.black,
                          textsize: 16,
                          textweight: FontWeight.w500),
                      RadioListTile(
                        value: 'residential',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                        title: TextWidget(
                            text: 'Residential',
                            textcolor: Colors.black,
                            textsize: 14,
                            textweight: FontWeight.w500),
                      ),
                      RadioListTile(
                        value: 'commercial',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                        title: TextWidget(
                            text: 'Commercial',
                            textcolor: Colors.black,
                            textsize: 14,
                            textweight: FontWeight.w500),
                      ),
                      TextWidget(
                          text: 'Dimensions',
                          textcolor: Colors.black,
                          textsize: 16,
                          textweight: FontWeight.w500),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            border: TableBorder.all(color: Colors.black),
                            headingRowColor:
                                MaterialStatePropertyAll(Color(0xFF38C0CE)),
                            columnSpacing: 16.0,
                            horizontalMargin: 12.0,
                            columns: [
                              DataColumn(
                                label: Text('               '),
                              ),
                              DataColumn(
                                label: Text('     Group Head     '),
                              ),
                              DataColumn(
                                label: Text('     Name     '),
                              ),
                              DataColumn(
                                label: Text('     Sequence     '),
                              ),
                              DataColumn(
                                label: Text('     Length     '),
                              ),
                              DataColumn(
                                label: Text('     Width     '),
                              ),
                              DataColumn(
                                label: Text('      Area     '),
                              )
                            ],
                            rows: _rows),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green)),
                          onPressed: () {
                            setState(() {
                              _showAddFieldDialog(context);
                            });
                            // _addDataRow(_groupHead.text, _area.text, _sequence.text,
                            //     _length.text, _width.text, _areaC.text);
                          },
                          child: TextWidget(
                              text: 'Add Field',
                              textcolor: Colors.white,
                              textsize: 10,
                              textweight: FontWeight.w500)),
                      SizedBox(
                        height: 40,
                      ),
                      DataTable(
                        border: TableBorder.all(color: Colors.black),
                        headingRowColor:
                            MaterialStatePropertyAll(Color(0xFF38C0CE)),
                        columnSpacing: 20.0,
                        horizontalMargin: 20.0,
                        columns: [
                          DataColumn(
                            label: Text('Type'),
                          ),
                          DataColumn(label: Text('Area'))
                        ],
                        rows: _selectedCategories.map((category) {
                          return DataRow(cells: [
                            DataCell(Text(category['category']!)),
                            DataCell(Text(category['area']!)),
                          ]);
                        }).toList(),

                        //  [
                        //   DataRow(cells: [
                        //     DataCell(Text('Balacony')),
                        //     DataCell(Text('')),
                        //   ]),
                        //   DataRow(cells: [
                        //     DataCell(Text('Carpet Area')),
                        //     DataCell(Text('0.0')),
                        //   ]),
                        //   DataRow(cells: [
                        //     DataCell(Text('Other Area')),
                        //     DataCell(Text('0.0')),
                        //   ]),
                        //   DataRow(cells: [
                        //     DataCell(Text('Refuge Area')),
                        //     DataCell(Text(
                        //       _area.text,
                        //     )),
                        //   ]),
                        //   DataRow(cells: [
                        //     DataCell(Text('Terrace Area')),
                        //     DataCell(Text('0.0')),
                        //   ])
                        // ]
                      )
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
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            print('2');

            final String? id = prefs.getString("id");
            print("id is:$id");
            print('1');
            updateLiveVisit();
          },
        ));
  }

  void _showAddFieldDialog(BuildContext context) {
    // Update the area based on the current length and width values
    void _updateArea() {
      double length = double.tryParse(_length.text) ?? 0.0;
      double width = double.tryParse(_width.text) ?? 0.0;
      double areaC = length * width;

      // Set the calculated area in the area text field
      _areaC.text = areaC.toString();
    }

    List<String> _areaOptions = [
      'Bedroom',
      'Hall',
      'Kitchen',
      'Passage',
      'Toilet',
      'Bathroom',
      'W.C',
      'Temple Room',
      'Study Room',
      'Store',
      'Servent Room',
      'Servent Toilet',
      'Internal Stairs',
      'Living room',
      'Lobby',
      'Balcony',
      'Pkt. Terrace<50 sqft',
      'Enc. Balcony',
      'Flower Bed',
      'Dry Balcony',
      'Verandh',
      'Back Yard',
      'Op Area Considered For Valuation (A)en Area',
      'Garden',
      'Niche',
      'Service Slab',
      'Ele. Projection',
      'Common Area',
      'Refuge Area',
      'Terrace Area'
    ];

    final Map<String, String> cateogory = {
      'Bedroom': 'Carpet Area',
      'Hall': 'Carpet Area',
      'Kitchen': 'Carpet Area',
      'Passage': 'Carpet Area',
      'Toilet': 'Carpet Area',
      'Bathroom': 'Carpet Area',
      'W.C': 'Carpet Area',
      'Temple Room': 'Carpet Area',
      'Study Room': 'Carpet Area',
      'Store': 'Carpet Area',
      'Servent Room': 'Carpet Area',
      'Servent Toilet': 'Carpet Area',
      'Internal Stairs': 'Carpet Area',
      'Living room': 'Carpet Area',
      'Lobby': 'Carpet Area',
      'Balcony': 'Balcony',
      'Pkt. Terrace<50 sqft': 'Balcony',
      'Enc. Balcony': 'Balcony',
      'Flower Bed': 'Balcony',
      'Dry Balcony': 'Balcony',
      'Verandh': 'Balcony',
      'Back Yard': 'Balcony',
      'Op Area Considered For Valuation (A)en Area': 'Other Area',
      'Garden': 'Other Area',
      'Niche': 'Other Area',
      'Service Slab': 'Other Area',
      'Ele. Projection': 'Other Area',
      'Common Area': 'Other Area',
      'Refuge Area': 'Refuge Area',
      'Terrace Area': 'Terrace Area'
    };

    // Add listeners to length and width text fields
    _length.addListener(() {
      _updateArea();
    });

    _width.addListener(() {
      _updateArea();
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the value as needed
            ),
            backgroundColor: Colors.white,
            // title: Text('ADD FIELD'),

            child: Container(
              height: MediaQuery.sizeOf(context).height - 200,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF38C0CE),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 18,
                      child: TextWidget(
                          text: 'ADD FIELD',
                          textcolor: Colors.white,
                          textsize: 20,
                          textweight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomRichText(
                            mainText: 'Select Area',
                            isRequired: true,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              searchDelay: Duration(microseconds: 1),
                              constraints: BoxConstraints.expand(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: MediaQuery.sizeOf(context).width),
                              searchFieldProps: TextFieldProps(
                                cursorColor: Color(0xFF38C0CE),
                                controller: _area,
                                decoration: InputDecoration(
                                  prefixIconColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          states.contains(MaterialState.focused)
                                              ? Color(0xFF38C0CE)
                                              : Colors.black),
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF38C0CE), width: 2),
                                  ),
                                ),
                              ),
                              fit: FlexFit.loose,
                              // showSelectedItems: true,
                              showSearchBox: true,
                            ),
                            // selectedItem: ,
                            items: _areaOptions,
                            enabled: true,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                                _groupHead.text =
                                    cateogory[value] ?? ''; // Set category
                                _area.text = value ?? ''; // Set area
                              });
                            },
                            // onSaved: (newValue) {
                            //   selectedOption = newValue!;
                            //   _groupHead.text = cateogory[newValue] ?? "";
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Area is required';
                              }
                              return null; // Return null if validation passes
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomMMTextField(
                            controller: _groupHead, readOnly: true,
                            hintText: 'Group Head',
                            // readOnly: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomMMTextField(
                            controller: _sequence,
                            hintText: 'Sequence',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomMMTextField(
                              controller: _length,
                              onChanged: (value) {
                                _updateArea();
                              },
                              hintText: 'Length'),
                          SizedBox(
                            height: 10,
                          ),
                          CustomMMTextField(
                              controller: _width,
                              onChanged: (value) {
                                _updateArea();
                              },
                              hintText: 'Width'),
                          SizedBox(
                            height: 10,
                          ),
                          CustomMMTextField(
                              readOnly: true,
                              controller: _areaC,
                              hintText: 'Area'),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF38C0CE)),
                                  fixedSize:
                                      MaterialStatePropertyAll(Size(120, 20)),
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust the value as needed
                                  )),
                                ),
                                onPressed: () {
                                  setState(() {
                                    // if (_area.text.isNotEmpty) {
                                    //   _addDataRow(
                                    //     _groupHead.text,
                                    //     _area.text,
                                    //     _sequence.text,
                                    //     _length.text,
                                    //     _width.text,
                                    //     _areaC.text,
                                    //   );
                                    // }
                                    _addDataRow(
                                      _groupHead.text,
                                      _area.text,
                                      _sequence.text,
                                      _length.text,
                                      _width.text,
                                      _areaC.text,
                                    );

                                    print("step 2.1:${_groupHead.text}");
                                    print("step 2.1 : ${_sequence.text}");

                                    Navigator.of(context).pop();
                                    print("step 2:${_groupHead.text}");
                                    print("step 2 : ${_sequence.text}");
                                  });
                                  print("step 3:${_groupHead.text}");
                                  print("step 3 : ${_sequence.text}");
                                },
                                child: TextWidget(
                                    text: 'ADD',
                                    textcolor: Colors.white,
                                    textsize: 12,
                                    textweight: FontWeight.w500)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _addDataRow(
    String groupHead,
    String area,
    String sequence,
    String length,
    String width,
    String areaC,
  ) {
    setState(() {
      print("groupHead: $groupHead");
      print("area: $area");
      print("sequence: $sequence");
      print("length: $length");
      print("width: $width");
      print("areaC: $areaC");
      _rows.add(DataRow(cells: [
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeDataRow();
          },
        )),
        DataCell(Text(
          groupHead,
        )),
        DataCell(Text(area)),
        DataCell(Text(sequence)),
        DataCell(Text(length)),
        DataCell(Text(width)),
        DataCell(Text(areaC)),
      ]));

      // Check if the category is already in the list
      var existingCategoryIndex = _selectedCategories.indexWhere(
        (category) => category['category'] == groupHead,
      );

      // If the category exists, update its area by adding the new value
      if (existingCategoryIndex != -1) {
        double currentArea = double.parse(
            _selectedCategories[existingCategoryIndex]['area'] ?? '0.0');
        double newArea = double.parse(areaC);
        _selectedCategories[existingCategoryIndex]['area'] =
            (currentArea + newArea).toString();
      } else {
        // If the category doesn't exist, add it to the list
        _selectedCategories.add({'category': groupHead, 'area': areaC});
      }
    });
  }

  void _removeDataRow() {
    setState(() {
      if (_rows.isNotEmpty) {
        DataRow lastRow = _rows.last;

        // Get the group head and areaC from the last row
        String groupHead = lastRow.cells[1].child.runtimeType == Text
            ? (lastRow.cells[1].child as Text).data!
            : '';
        String areaC = lastRow.cells[6].child.runtimeType == Text
            ? (lastRow.cells[6].child as Text).data!
            : '0.0';

        // Remove the last row
        _rows.removeLast();

        // Find the corresponding category in _selectedCategories
        var existingCategoryIndex = _selectedCategories.indexWhere(
          (category) => category['category'] == groupHead,
        );

        // If the category exists, update its area by subtracting the deleted value
        if (existingCategoryIndex != -1) {
          double currentArea = double.parse(
              _selectedCategories[existingCategoryIndex]['area'] ?? '0.0');
          double deletedArea = double.parse(areaC);
          _selectedCategories[existingCategoryIndex]['area'] =
              (currentArea - deletedArea).toString();
        }
      }
    });
  }
}
