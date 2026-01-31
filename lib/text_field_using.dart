import 'package:flutter/material.dart';

class TextFieldUsingBuilding extends StatefulWidget {
  const TextFieldUsingBuilding({super.key});

  @override
  State<TextFieldUsingBuilding> createState() => _TextFieldUsingBuildingState();
}

class _TextFieldUsingBuildingState extends State<TextFieldUsingBuilding> {
  int _maxLine = 1;
  late TextEditingController _emailController;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(() {
      setState(() {
        _maxLine = _emailFocusNode.hasFocus ? 3 : 1;
      });
      
    });

    _emailController = TextEditingController(text: "ilk deger");
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _emailController.clear();
            },
            child: Text("Sıfırla"),
          ),
          SizedBox(height: 6),
          TextField(
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.search,
            maxLength: 50,
            maxLines: _maxLine,
            cursorColor: Colors.red,
            readOnly: false,
            onChanged: (value) {
              _emailController.text = value;
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
          Text(
            _emailController.text,
            style: TextStyle(fontSize: 30, fontFamily: "RobotoSlab"),
          ),
        ],
      ),
    );
    //buradaki kullanım tarzları farklı
  }
}
