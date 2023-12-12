import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_valuation/View/Screens/home_screen.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';

import '../custom_widgets/popup_menu.dart';
import '../custom_widgets/text_widgets.dart';
import 'case_status_screen.dart';
import 'mm_sheets_screen.dart';
import 'physical_inspection1_screen1.dart';
import 'physical_inspection2_screen2.dart';
import 'tech_initiation_screen.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Color containerColor = Colors.red;
  bool showSecondUI = false;
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
        showSecondUI = true;
      });
    }
  }

  void _deleteImage() {
    setState(() {
      _pickedImage = null;
      showSecondUI = false; // Toggle back to "Choose Image"
    });
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
            text: 'Images',
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
              Container(
                height: 420,
                width: MediaQuery.sizeOf(context).width,
                // color: containerColor,
                child: GoogleMap(
                  initialCameraPosition: _kGoogle,
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                child: DataTable(
                  border: TableBorder.all(),
                  columns: [
                    DataColumn(label: Text('Latitude')),
                    DataColumn(
                        label: Text(
                      'value',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        'Longitude',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                      DataCell(Text('values'))
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {
                        setState(() {
                          containerColor = Colors.black;
                        });
                      },
                      child: Text(
                        'Capture Satellite View',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {
                        setState(() {
                          containerColor = Colors.yellow;
                        });
                      },
                      child: Text(
                        'Capture Normal View',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget(
                  text: 'Upload Drawing Image',
                  textcolor: Colors.black,
                  textsize: 16,
                  textweight: FontWeight.w700),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: MediaQuery.sizeOf(context).width,
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1.2,
                  dashPattern: [8, 8, 8, 8],
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: showSecondUI
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: MediaQuery.sizeOf(context).width / 3,
                                  color: Colors.amber,
                                  child: _pickedImage != null
                                      ? Image.file(
                                          File(_pickedImage!.path),
                                          fit: BoxFit.cover,
                                        )
                                      : Container(),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(1),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(50, 40)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFF38C0CE))),
                                        onPressed: () {
                                          _pickImage();
                                        },
                                        child: Text(
                                          'Replace',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(1),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(50, 40)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () {
                                          _deleteImage();
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ],
                            )
                          : Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(1),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      minimumSize: MaterialStateProperty.all(
                                          Size(50, 40)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue)),
                                  onPressed: () {
                                    _pickImage();
                                  },
                                  child: Text(
                                    'Choose Image',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomRichText(
                mainText: 'Upload Elevation Image',
                isRequired: true,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: MediaQuery.sizeOf(context).width,
                child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1.2,
                    dashPattern: [8, 8, 8, 8],
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: showSecondUI
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: MediaQuery.sizeOf(context).height,
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    color: Colors.amber,
                                    child: _pickedImage != null
                                        ? Image.file(
                                            File(_pickedImage!.path),
                                            fit: BoxFit.cover,
                                          )
                                        : Container(),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(1),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      Size(50, 40)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFF38C0CE))),
                                          onPressed: () {
                                            _pickImage();
                                          },
                                          child: Text(
                                            'Replace',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(1),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      Size(50, 40)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.red)),
                                          onPressed: () {
                                            _deleteImage();
                                          },
                                          child: Text(
                                            'Delete',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            : Center(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(1),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(50, 40)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    onPressed: () {
                                      _pickImage();
                                    },
                                    child: Text(
                                      'Choose Image',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ))),
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget(
                  text: 'Upload Photographs (Choose Multiple Image)',
                  textcolor: Colors.black,
                  textsize: 16,
                  textweight: FontWeight.w500),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        minimumSize: MaterialStateProperty.all(Size(50, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {},
                    child: Text(
                      'Choose Images',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
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
      ),
    );
  }
}
