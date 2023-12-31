import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? enabled;
  final String? errortext;

  const CustomTextField({
    required this.controller,
    this.hintText,
    this.validator,
    Key? key,
    this.keyboardType,
    this.readOnly,
    this.enabled,
    this.errortext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: TextFormField(
        cursorColor: Color(0xFF38C0CE),
        enabled: enabled ?? true,
        readOnly: readOnly ?? false,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          errorText: errortext,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          filled: enabled != null && !enabled!,
          fillColor: readOnly != null && readOnly!
              ? Colors.grey.shade300
              : Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xFF38C0CE),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
