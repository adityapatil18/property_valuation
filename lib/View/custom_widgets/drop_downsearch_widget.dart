import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?> onChanged;
  final TextEditingController controller;

  CustomDropdownSearch({
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        searchDelay: Duration(microseconds: 1),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        searchFieldProps: TextFieldProps(
          controller: controller,
          cursorColor: Color(0xFF38C0CE),
          decoration: InputDecoration(
            prefixIconColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.focused)
                  ? Color(0xFF38C0CE)
                  : Colors.black,
            ),
            prefixIcon: Icon(
              Icons.search,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF38C0CE), width: 2),
            ),
          ),
        ),
        fit: FlexFit.loose,
        showSearchBox: true,
      ),
      items: items,
      selectedItem: selectedItem,
      enabled: true,
      onChanged: onChanged,
    );
  }
}
