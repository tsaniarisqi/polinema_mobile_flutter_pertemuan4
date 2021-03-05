import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Input.dart';
import 'Convert.dart';
import 'Result.dart';
import 'riwayatKonversi.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final etInput = TextEditingController();
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;

  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  void _hitungSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
      //untuk menampilkan hasil riwayat
      listViewItem.add("$_newValue : $_result");
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      _hitungSuhu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(etInput: etInput),
              DropdownKonversi(listItem: listItem, newValue: _newValue, dropDownOnChanged: dropdownOnChanged),
              Result(result: _result),
              Convert(konvertHandler: _hitungSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                //mengisi ruang kososong
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

