import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonApiFutureBuilder extends StatefulWidget {
  const JsonApiFutureBuilder({super.key});

  @override
  State<JsonApiFutureBuilder> createState() => _JsonApiFutureBuilderState();
}

_loadJson() async {
  var jsonString = await rootBundle.loadString('assets/data/persons.json');
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  debugPrint(jsonMap.toString());
}

class _JsonApiFutureBuilderState extends State<JsonApiFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    _loadJson();
    return Container();
  }
}
