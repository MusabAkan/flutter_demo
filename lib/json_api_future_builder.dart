import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/person_model.dart';

class JsonApiFutureBuilder extends StatefulWidget {
  const JsonApiFutureBuilder({super.key});

  @override
  State<JsonApiFutureBuilder> createState() => _JsonApiFutureBuilderState();
}

Future<List<Person>> _loadJson() async {
  try {
    await Future.delayed(Duration(seconds: 3));
    var jsonString = await rootBundle.loadString('assets/data/persons.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    //debugPrint(jsonMap.toString());

    List<dynamic> jsonList = jsonMap['persons'];
    List<Person> kisiler = jsonList
        .map((eleman) => Person.fromJson(eleman))
        .toList();

    for (var element in kisiler) {
      debugPrint(element.toJson().toString());
    }

    return kisiler;
  } catch (e) {
    debugPrint("Hata : $e");
    return Future.error(e);
  }
}

class _JsonApiFutureBuilderState extends State<JsonApiFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste Veri İsimleri")),
      body: FutureBuilder(
        future: _loadJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var myPersonList = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                var tekPerson = myPersonList[index];
                return ListTile(
                  title: Text(tekPerson.isim),
                  leading: CircleAvatar(child: Text(tekPerson.id.toString())),
                  subtitle: Text(tekPerson.adress.toString()),
                );
              },
              itemCount: myPersonList.length,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata Verdi"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
