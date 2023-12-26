import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_valuation/View/Screens/home_screen.dart';
import 'package:property_valuation/View/custom_widgets/loading_indicator.dart';
import 'package:property_valuation/View/custom_widgets/navigator_conatiner.dart';
import 'package:property_valuation/View/custom_widgets/richtext_widget.dart';
import 'package:property_valuation/model/enginer_visit_case_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // Completer<GoogleMapController> _controller = Completer();
  // // on below line we have specified camera position
  // static final CameraPosition _kGoogle = const CameraPosition(
  //   target: LatLng(20.42796133580664, 80.885749655962),
  //   zoom: 14.4746,
  // );

  // // on below line we have created the list of markers
  // final List<Marker> _markers = <Marker>[
  //   Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(20.42796133580664, 75.885749655962),
  //       infoWindow: InfoWindow(
  //         title: 'My Position',
  //       )),
  // ];

// // created method for getting user current location
//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) async {
//       await Geolocator.requestPermission();
//       print("ERROR" + error.toString());
//     });
//     return await Geolocator.getCurrentPosition();
//   }

  Color containerColor = Colors.red;
  bool showSecondUIForDrawing = false;
  bool showSecondUIForElevation = false;
  bool showSecondUIForMultipleImages = false;
  late ImagePicker _imagePickerForDrawing;
  XFile? _pickedImageForDrawing;
  late ImagePicker _imagePickerForElevation;
  XFile? _pickedImageForElevation;
  String? selectedImageDateTimeForElevation;
  List<XFile>? _multiplePickedImages;
  late ImagePicker _pickedMultipleImages;
  String pickedImageNameForDrawing = "";
  String captureImageNameForDrawing = "";
  // String pickedImageNameForElevation = "";
  String captureImageNameForElevation = "";
  bool _isLoading = true;
  String? _currentSpecificId;

  @override
  void initState() {
    super.initState();
    _imagePickerForDrawing = ImagePicker();
    _imagePickerForElevation = ImagePicker();
    _pickedMultipleImages = ImagePicker();
    loadData();
    _loadCurrentSpecificId();
  }

  Future<void> _loadCurrentSpecificId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedSpecificId = prefs.getString('currentSpecificId');
    if (savedSpecificId != null) {
      setState(() {
        _currentSpecificId = savedSpecificId;
        print('Loaded Specific ID: $_currentSpecificId');
      });
    }
  }

  Future<Map<String, dynamic>?> makeApiCall(File imageFile) async {
    try {
      var apiUrl =
          "https://apivaluation.techgigs.in/admin/livevisit/fileupload";
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      var fileStream = http.ByteStream(imageFile.openRead().cast());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile('image', fileStream, length,
          filename: imageFile.path.split("/").last);
      request.files.add(multipartFile);

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print('abc:$responseData');
        print('Images uploaded successfully!');

        return json.decode(responseData);
      } else {
        print("API Call failed with status ${response.statusCode}");
        print("Response content: $responseData");

        return null; // or handle the error in an appropriate way
      }
    } catch (error) {
      print("Error making API call: $error");
      rethrow; // Optionally rethrow the error for higher-level error handling
    }
  }

  Future<void> updateLiveVisit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('2');

    final String? id = prefs.getString("currentSpecificId");
    print("id is:$id");

    try {
      Map<String, dynamic> requestBody = {
        "id": id,
        "Imagesmap": [
          {
            "latitude": 19.075659230158568,
            "longitude": 72.86666957187501,
            "mapimage": "",
            "latitudedms": "19° 4' 32\" N",
            "longitudedms": "72° 52' 0\" E",
            "uploadimage": [
              {
                "name": _pickedImageForElevation != null
                    ? _pickedImageForElevation!.name
                    : captureImageNameForElevation ?? ""
              }
            ],
            "drawimage": _pickedImageForDrawing != null
                ? _pickedImageForDrawing!.name
                : captureImageNameForDrawing ?? '',
            "Imagesmaplist": _buildImagesMapList(),
          }
        ],
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

  List<Map<String, String>> _buildImagesMapList() {
    List<Map<String, String>> imagesList = [];

    if (_multiplePickedImages != null && _multiplePickedImages!.isNotEmpty) {
      for (int index = 0; index < _multiplePickedImages!.length; index++) {
        imagesList.add({
          "image": _multiplePickedImages![index].path.split("/").last,
          "name": "image${index + 1}",
          "sequence": (index + 1).toString(),
        });
      }
    }

    return imagesList;
  }

  Future<void> _pickImageforDrawing() async {
    XFile? pickedImage1 = await _imagePickerForDrawing.pickImage(
        source: ImageSource.gallery, imageQuality: 70);
    if (pickedImage1 != null) {
      setState(() {
        _pickedImageForDrawing = pickedImage1;
        pickedImageNameForDrawing = pickedImage1.name;
        print(' name p d: $pickedImageNameForDrawing');

        showSecondUIForDrawing = true;
      });
    }
  }

  Future<void> _captureImageforDrawing() async {
    XFile? capturedImage1 = await _imagePickerForDrawing.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (capturedImage1 != null) {
      setState(() {
        _pickedImageForDrawing = capturedImage1;
        captureImageNameForDrawing = capturedImage1.name;
        print(' name c d: $captureImageNameForDrawing');

        showSecondUIForDrawing = true;
      });
    }
  }

  // Future<void> _pickImageForElevation() async {
  //   XFile? pickedImage2 = await _imagePickerForElevation.pickImage(
  //       source: ImageSource.gallery, imageQuality: 70);
  //   if (pickedImage2 != null) {
  //     DateTime imageDateTime = File(pickedImage2.path).lastModifiedSync();

  //     String formattedDateTime =
  //         DateFormat.yMd().add_jm().format(imageDateTime);
  //     setState(() {
  //       _pickedImageForElevation = pickedImage2;
  //       pickedImageNameForElevation = pickedImage2.name;
  //       print(' name p e: $pickedImageNameForElevation');

  //       showSecondUIForElevation = true;
  //       selectedImageDateTimeForElevation = formattedDateTime;
  //     });
  //   }
  // }

  Future<void> _captureImageForElevation() async {
    XFile? capturedImage2 = await _imagePickerForElevation.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (capturedImage2 != null) {
      DateTime imageDateTime = File(capturedImage2.path).lastModifiedSync();

      String formattedDateTime =
          DateFormat.yMd().add_jm().format(imageDateTime);
      setState(() {
        _pickedImageForElevation = capturedImage2;
        captureImageNameForElevation = capturedImage2.name;
        print(' name c e: $captureImageNameForElevation');

        showSecondUIForElevation = true;
        selectedImageDateTimeForElevation = formattedDateTime;
      });
    }
  }

  void _deleteImageForDrawing() {
    setState(() {
      _pickedImageForDrawing = null;
      showSecondUIForDrawing = false; // Toggle back to "Choose Image"
    });
  }

  void _deleteImageForElevation() {
    setState(() {
      _pickedImageForElevation = null;
      showSecondUIForElevation = false;
    });
  }

  Future<void> _pickMultipleImages() async {
    List<XFile>? pickedImages = await _pickedMultipleImages.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      setState(() {
        _multiplePickedImages = pickedImages;
        showSecondUIForMultipleImages = true;
      });
    }
  }

  void _deleteMultipleImage(int index) {
    setState(() {
      _multiplePickedImages?.removeAt(index);
    });
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
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
                    Container(
                      height: 420,
                      width: MediaQuery.sizeOf(context).width,
                      // color: containerColor,
                      // child: GoogleMap(
                      //   initialCameraPosition: _kGoogle,
                      //   markers: Set<Marker>.of(_markers),
                      //   mapType: MapType.normal,
                      //   myLocationEnabled: true,
                      //   compassEnabled: true,
                      //   onMapCreated: (GoogleMapController controller) {
                      //     _controller.complete(controller);
                      //   },
                      // ),
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
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
                      height: 260,
                      width: MediaQuery.sizeOf(context).width,
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1.2,
                        dashPattern: [8, 8, 8, 8],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: showSecondUIForDrawing
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: MediaQuery.sizeOf(context).height,
                                      width:
                                          MediaQuery.sizeOf(context).width / 3,
                                      child: _pickedImageForDrawing != null
                                          ? Image.file(
                                              File(
                                                  _pickedImageForDrawing!.path),
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
                                            _pickImageforDrawing();
                                          },
                                          child: Text(
                                            'Replace',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        1),
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20))),
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        Size(50, 40)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red)),
                                            onPressed: () {
                                              _deleteImageForDrawing();
                                            },
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                      // Show a dialog with two options: "Capture Image" and "Pick Image"
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Choose Image Source"),
                                            actions: [
                                              TextButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); // Close the dialog
                                                  _captureImageforDrawing(); // Capture Image
                                                },
                                                icon: Icon(Icons.camera),
                                                label: Text("Capture Image"),
                                              ),
                                              TextButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); // Close the dialog
                                                  _pickImageforDrawing(); // Pick Image from Gallery
                                                },
                                                icon: Icon(Icons.photo),
                                                label: Text("Pick Image"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Choose Image',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                        ),
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
                      height: 260,
                      width: MediaQuery.sizeOf(context).width,
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1.2,
                        dashPattern: [8, 8, 8, 8],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: showSecondUIForElevation
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 200,
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3,
                                          child: _pickedImageForElevation !=
                                                  null
                                              ? Image.file(
                                                  File(_pickedImageForElevation!
                                                      .path),
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(),
                                        ),
                                        Text(
                                          '$selectedImageDateTimeForElevation',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        1),
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20))),
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        Size(50, 40)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(0xFF38C0CE))),
                                            onPressed: () {
                                              _captureImageForElevation();
                                            },
                                            child: Text(
                                              'Replace',
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                            _deleteImageForElevation();
                                          },
                                          child: Text(
                                            'Delete',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
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
// Show a dialog with two options: "Capture Image" and "Pick Image"
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Choose Image Source"),
                                            actions: [
                                              TextButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); // Close the dialog
                                                  _captureImageForElevation(); // Capture Image
                                                },
                                                icon: Icon(Icons.camera),
                                                label: Text("Capture Image"),
                                              ),
                                              // TextButton.icon(
                                              //   onPressed: () {
                                              //     Navigator.pop(
                                              //         context); // Close the dialog
                                              //     // _pickImageForElevation(); // Pick Image from Gallery
                                              //   },
                                              //   icon: Icon(Icons.photo),
                                              //   label: Text("Pick Image"),
                                              // ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Choose Image',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                        ),
                      ),
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
                    if (_multiplePickedImages != null)
                      Column(
                        children: [
                          for (int index = 0;
                              index < _multiplePickedImages!.length;
                              index++)
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.file(
                                      File(_multiplePickedImages![index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _deleteMultipleImage(index);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )
                        ],
                      ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              minimumSize:
                                  MaterialStateProperty.all(Size(50, 40)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: _pickMultipleImages,
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
        child: NavigatorConatiner(),
        onTap: () async {
          try {
            // Check if elevation image is selected
            if (_pickedImageForElevation == null) {
              // Show a message or alert to inform the user that elevation image is required
              // You can use a Flutter dialog, snackbar, or any other way to show the message
              // For example, showing a snackbar:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Elevation image is required!'),
                ),
              );
              return; // Stop further execution
            }

            // Perform image upload when the bottom navigation bar is tapped
            if (_pickedImageForDrawing != null) {
              await makeApiCall(File(_pickedImageForDrawing!.path));
            }
            if (_pickedImageForElevation != null) {
              await makeApiCall(File(_pickedImageForElevation!.path));
            }

            await updateLiveVisit();

            // If the update is successful, navigate to the next screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MMSheetsScreen(),
              ),
            );

// If the update is successful, show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Data updated successfully!'),
                duration: Duration(seconds: 2),
              ),
            );
          } catch (e) {
            // Handle any errors that occur during the process
            print('Error: $e');
          }
        },
      ),
    );
  }
}
