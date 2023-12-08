import 'package:flutter/material.dart';

class CustomSelectionTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> options;
  final Function(String)? onChanged;

  const CustomSelectionTextField({
    required this.controller,
    required this.options,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CustomSelectionTextFieldState createState() =>
      _CustomSelectionTextFieldState();
}

class _CustomSelectionTextFieldState extends State<CustomSelectionTextField> {
  bool _isOptionsDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      onTap: () {
        _toggleOptionsDialog();
      },
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Select option',
        hintStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: Icon(
          _isOptionsDialogOpen
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
      ),
    );
  }

  void _toggleOptionsDialog() {
    if (!_isOptionsDialogOpen) {
      _showOptionsDialog(context, widget.options);
    }
    setState(() {
      _isOptionsDialogOpen = !_isOptionsDialogOpen;
    });
  }

  void _showOptionsDialog(BuildContext context, List<String> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 250,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(options[index]),
                          onTap: () {
                            _selectOption(options[index]);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                  ListTile(
                    trailing: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _toggleOptionsDialog();
                        // Unfocus the TextFormField when the dialog is closed
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(color: Color(0xFF38C0CE)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectOption(String option) {
    // Update the text in the TextFormField with the selected option
    widget.controller.text = option;
    _toggleOptionsDialog(); // Close the dialog and update the state
  }
}
