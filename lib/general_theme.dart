import 'package:flutter/material.dart';

 

class MyAppSelectColorWidget extends StatelessWidget {
  const MyAppSelectColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: ColorPickerPage());
  }
}

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;

  final Map<Color, String> colors = {
    Colors.red: 'Kırmızı',
    Colors.blue: 'Mavi',
    Colors.green: 'Yeşi',
    Colors.yellow: 'Sarı',
    Colors.purple: 'Mor',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Renk Seçici'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Mavi'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<Color>(
                  value: selectedColor,
                  items: colors.entries.map((entry) {
                    return DropdownMenuItem<Color>(
                      value: entry.key,
                      child: Row(
                        children: [
                          Container(width: 20, height: 20, color: entry.key),
                          SizedBox(width: 10),
                          Text(entry.value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedColor = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
