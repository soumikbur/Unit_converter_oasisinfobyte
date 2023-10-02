import 'package:flutter/material.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String selectedConversion = 'Celsius to Fahrenheit';

  void convert() {
    setState(() {
      if (selectedConversion == 'Celsius to Fahrenheit') {
        convertedValue = (inputValue * 9 / 5) + 32;
      } else if (selectedConversion == 'Fahrenheit to Celsius') {
        convertedValue = (inputValue - 32) * 5 / 9;
      } else if (selectedConversion == 'Meters to Feet') {
        convertedValue = inputValue * 3.281;
      } else if (selectedConversion == 'Feet to Meters') {
        convertedValue = inputValue / 3.281;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit Converter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Unit Converter',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a value',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  inputValue = double.tryParse(text) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedConversion,
              onChanged: (newValue) {
                setState(() {
                  selectedConversion = newValue!;
                });
              },
              items: <String>[
                'Celsius to Fahrenheit',
                'Fahrenheit to Celsius',
                'Meters to Feet',
                'Feet to Meters',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: convert,
              child: Text('Convert'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Converted Value:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '${convertedValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
