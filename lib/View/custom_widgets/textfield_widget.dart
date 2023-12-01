import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? enabled;

  const CustomTextField({
    required this.controller,
    this.hintText,
    this.validator,
    Key? key,
    this.keyboardType,
    this.readOnly,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        filled: enabled != null && !enabled!,
        fillColor:
            readOnly != null && readOnly! ? Colors.grey.shade300 : Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
