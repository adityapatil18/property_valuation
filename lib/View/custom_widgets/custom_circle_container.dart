import 'package:flutter/material.dart';
import 'package:property_valuation/View/custom_widgets/text_widgets.dart';

class CustomCricleWidget extends StatelessWidget {
  final String labelText;
  final String value;
  final Color containerColor;
  final double textSize;

  // Constant container size
  static const double _containerSize = 60.0;

  CustomCricleWidget({
    required this.labelText,
    required this.value,
    required this.containerColor,
    this.textSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _containerSize,
          width: _containerSize,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(_containerSize / 2),
          ),
          child: Center(
            child: TextWidget(
              text: value,
              textcolor: Colors.white,
              textsize: 20,
              textweight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextWidget(
            text: labelText,
            textcolor: Colors.black,
            textsize: 14,
            textweight: FontWeight.w500)
      ],
    );
  }
}
