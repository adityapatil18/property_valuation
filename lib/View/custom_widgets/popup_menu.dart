import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final Function(String) onSelected;

  const CustomPopupMenuButton({Key? key, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      iconColor: Colors.white,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'techInitiation',
          child: Text('Tech Initiation'),
        ),
        PopupMenuItem<String>(
          value: 'images',
          child: Text('Images'),
        ),
        PopupMenuItem<String>(
          value: 'mmSheets',
          child: Text('MM Sheets'),
        ),
        PopupMenuItem<String>(
          value: 'physicalInspection1',
          child: Text('Physical Inspection 1'),
        ),
        PopupMenuItem<String>(
          value: 'physicalInspection2',
          child: Text('Physical Inspection 2'),
        ),
        PopupMenuItem<String>(
          value: 'caseStatus',
          child: Text('Case Status'),
        ),
      ],
    );
  }
}
