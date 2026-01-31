// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/text_field_using.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      title: 'Musakan',

      home: Scaffold(
        appBar: AppBar(title: Text('Deneme Merkezi')),
        body: TextFieldUsingBuilding(),
      ),
    ),
  );
}
