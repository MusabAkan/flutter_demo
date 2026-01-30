import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool isCircular = false;
  bool isShowColorName = true;

  void _rastgeleRenkSonuc() {
    final colorWith = colors.keys.toList();
    final randomColor = colorWith[Random().nextInt(colorWith.length)];
    setState(() {
      selectedColor = randomColor;
    });
  }

  void _renginKodunuGoster() {
    Fluttertoast.showToast(
      msg:
          "RGB : (${selectedColor.red}, ${selectedColor.green}, ${selectedColor.blue})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 24.0,
    );
  }

  void _containerSekliniDegistir() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  final Map<Color, String> colors = {
    Colors.red: 'Kırmızı',
    Colors.blue: 'Mavi',
    Colors.green: 'Yeşil',
    Colors.yellow: 'Sarı',
    Colors.purple: 'Mor',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renk Seçici'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'a',
                  child: Row(
                    children: [
                      Icon(
                        isShowColorName
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: selectedColor,
                      ),
                      SizedBox(width: 8),
                      Text(
                        isShowColorName
                            ? 'Renk Adını Gizle'
                            : 'Renk Adının Göster',
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(isCircular ? 100 : 10),
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
            isShowColorName
                ? Text(colors[selectedColor] ?? 'Seçilen Renk')
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ElevatedButton(
                    onPressed: _rastgeleRenkSonuc,
                    child: Text('Rastgele'),
                  ),
                  IconButton(
                    onPressed: _renginKodunuGoster,
                    icon: Icon(Icons.info_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      _containerSekliniDegistir();
                    },
                    icon: Icon(
                      isCircular
                          ? Icons.crop_square_outlined
                          : Icons.circle_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
