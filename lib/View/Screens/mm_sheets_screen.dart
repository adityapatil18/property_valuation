import 'package:flutter/material.dart';
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

  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
                      _showAddFieldDialog(context);
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
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Balacony')),
                        DataCell(Text('0.0')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Carpet Area')),
                        DataCell(Text('0.0')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Other Area')),
                        DataCell(Text('0.0')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Refuge Area')),
                        DataCell(Text('0.0')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Terrace Area')),
                        DataCell(Text('0.0')),
                      ])
                    ])
              ],
            ),
          ),
        ));
  }

  void _showAddFieldDialog(BuildContext context) {
    TextEditingController _area = TextEditingController();
    TextEditingController _groupHead = TextEditingController();
    TextEditingController _sequence = TextEditingController();
    TextEditingController _length = TextEditingController();
    TextEditingController _width = TextEditingController();
    TextEditingController _areaC = TextEditingController();

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
          return Container(
            height: MediaQuery.sizeOf(context).height - 200,
            width: MediaQuery.sizeOf(context).width,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text('ADD FIELD'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(
                      mainText: 'Select Area',
                      isRequired: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomSelectionTextField(
                        controller: _area, options: _areaOptions),
                    SizedBox(
                      height: 10,
                    ),
                    CustomMMTextField(
                      controller: _groupHead,
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
                        readOnly: true, controller: _areaC, hintText: 'Area')
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      if (_area.text.isNotEmpty) {
                        _addDataRow(
                          _groupHead.text,
                          _area.text,
                          _sequence.text,
                          _length.text,
                          _width.text,
                          _areaC.text,
                        );
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'))
              ],
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
      _rows.add(DataRow(cells: [
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeDataRow();
          },
        )),
        DataCell(Text(groupHead)),
        DataCell(Text(area)),
        DataCell(Text(sequence)),
        DataCell(Text(length)),
        DataCell(Text(width)),
        DataCell(Text(areaC)),
      ]));
    });
  }

  void _removeDataRow() {
    setState(() {
      _rows.removeLast();
    });
  }
}
