import 'package:flutter/material.dart';

class CustomMMTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool readOnly;
  final String hintText;

  const CustomMMTextField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.readOnly = false,
    required this.hintText, // Set a default value for readOnly
  }) : super(key: key);

  @override
  _CustomMMTextFieldState createState() => _CustomMMTextFieldState();
}

class _CustomMMTextFieldState extends State<CustomMMTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color(0xFF38C0CE),
      cursorWidth: 2,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w400),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF38C0CE), width: 2)),
        focusColor: Color(0xFF38C0CE),
        border: UnderlineInputBorder(),
      ),
    );
  }
}
