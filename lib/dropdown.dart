import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownKonversi extends StatelessWidget {
  const DropdownKonversi({
    Key key,
    @required this.listItem,
    @required String newValue,
    @required this.dropDownOnChanged,
  }) : _newValue = newValue, super(key: key);

  final List<String> listItem;
  final String _newValue;
  final Function dropDownOnChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // string untuk memberi tipe data value dari dropdown adalah bertipe data string
      items: listItem.map((String value) {
        // untuk iterasi
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: (String changeValue) {
        dropDownOnChanged: dropDownOnChanged(changeValue);
      },
    );
  }
}
