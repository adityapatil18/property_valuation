import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemAsString;
  final void Function(T?)? onChanged;
  final void Function(T?)? onSaved;
  final String Function(T?)? validator;
  final void Function()? onClose;
  final TextEditingController? controller;
  final bool Function(T, T)? compareFn;

  CustomDropdownSearch({
    required this.items,
    required this.selectedItem,
    required this.itemAsString,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onClose,
    this.controller,
    this.compareFn,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: items,
      selectedItem: selectedItem,
      itemAsString:
          itemAsString != null ? itemAsString! : (T item) => item.toString(),
      onChanged: onChanged,
      onSaved: onSaved,
      compareFn: compareFn != null
          ? compareFn!
          : (T item, T selectedItem) => item == selectedItem,
      validator: validator,
      popupProps: PopupProps.menu(
        searchDelay: Duration(microseconds: 1),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        searchFieldProps: TextFieldProps(
          controller: controller,
          cursorColor: Color(0xFF38C0CE),
          autocorrect: true,
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
        showSelectedItems: true,
        showSearchBox: true,
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Text('${item}'),
          );
        },
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
