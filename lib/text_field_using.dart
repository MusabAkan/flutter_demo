import 'package:flutter/material.dart';

class TextFieldUsingBuilding extends StatefulWidget {
  const TextFieldUsingBuilding({super.key});

  @override
  State<TextFieldUsingBuilding> createState() => _TextFieldUsingBuildingState();
}

class _TextFieldUsingBuildingState extends State<TextFieldUsingBuilding> {
  String deger = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.search,
            maxLength: 50,
            maxLines: 3,
            cursorColor: Colors.red,
            readOnly: false,
            onChanged: (value) {
              setState(() {
                deger = value;
              });
            },
            decoration: InputDecoration(
              icon: Icon(Icons.remove_road),
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.grey.shade100,
              hintStyle: TextStyle(color: Colors.orange),
              filled: true,
              hintText: 'Email giriniz',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 8),
          Text(deger, style: TextStyle(fontSize: 30, fontFamily: "RobotoSlab")),
        ],
      ),
    );
    //buradaki kullanım tarzları farklı
  }
}
