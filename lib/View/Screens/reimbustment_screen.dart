import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class ReimbustmentScreen extends StatelessWidget {
  const ReimbustmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF38C0CE),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: TextWidget(
            text: 'Reimburstment Form',
            textcolor: Colors.white,
            textsize: 18,
            textweight: FontWeight.w500),
        actions: [
          TextButton(
              onPressed: () {},
              child: TextWidget(
                  text: 'Submit',
                  textcolor: Colors.white,
                  textsize: 18,
                  textweight: FontWeight.w500))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    text: 'Name: abc',
                    textcolor: Colors.black,
                    textsize: 16,
                    textweight: FontWeight.w500),
                TextWidget(
                    text: '2023-11-22',
                    textcolor: Colors.black,
                    textsize: 16,
                    textweight: FontWeight.w500),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
                text: 'Upload Image',
                textcolor: Colors.black,
                textsize: 16,
                textweight: FontWeight.w500),
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
                  child: Center(
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
                        onPressed: () {},
                        child: Text(
                          'Choose Image',
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: Color(0xFF38C0CE),
              borderRadius: BorderRadius.circular(10)),
          child: TextWidget(
              text: 'Submit to Propval',
              textcolor: Colors.white,
              textsize: 16,
              textweight: FontWeight.w500),
        ),
      ),
    );
  }
}
