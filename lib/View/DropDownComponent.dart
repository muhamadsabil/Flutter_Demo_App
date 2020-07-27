import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {

  List<String> items = List<String>();//['One','two','three'];
  DropDownWidget(List<String> listItems){
    items = listItems;
  }
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState(items);
}

class _DropDownWidgetState extends State<DropDownWidget> {


  List<String> listItems = List<String>();
  _DropDownWidgetState(List<String> items){
    listItems = items;
  }
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black45),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: listItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

