import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:property_valuation/View/Screens/case_status_screen.dart';
import 'package:property_valuation/View/custom_widgets/custom_mm_textfield.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/View/custom_widgets/selction_textfeild_widget.dart';

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
  final List<DataRow> _rows = [];
  TextEditingController _groupHead = TextEditingController();
  TextEditingController _area = TextEditingController();
  TextEditingController _sequence = TextEditingController();
  TextEditingController _length = TextEditingController();
  TextEditingController _width = TextEditingController();
  TextEditingController _areaC = TextEditingController();

  List<Map<String, String>> _selectedCategories = [];

  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> updateLiveVisit(String id, List<Map<String, dynamic>> mmsheet) async {
    try {
      Response response = await put(Uri.parse(
          "https://apivaluation.techgigs.in/admin/livevisit/update_one_livevisit"),
        body: {

        }  );
    } catch (e) {}
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
        body: SingleChildScrollView(
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
                  headingRowColor: MaterialStatePropertyAll(Color(0xFF38C0CE)),
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
          onTap: () {},
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
                            selectedItem: selectedOption,
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
      // Reset text controllers
      _groupHead.text = '';
      _area.text = '';
      _sequence.text = '';
      _length.text = '';
      _width.text = '';
      _areaC.text = '';
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
      _rows.removeLast();
    });
  }
}
