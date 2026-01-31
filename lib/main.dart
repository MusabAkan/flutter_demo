// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_application_1/general_theme.dart';
import 'package:flutter_application_1/json_api_future_builder.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: JsonApiFutureBuilder(),));
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, useMaterial3: false),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _counterAdd() {
    setState(() {
      _counter++;
    });
  }

  void _counterReset() {
    setState(() {
      _counter = 0;
    });
  }

  void _countRemove() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bölüm 2')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Butona Basılma Sayısı', style: TextStyle(fontSize: 20)),
            Text(
              _counter.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ).copyWith(color: _counter < 0 ? Colors.red : Colors.green),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterAdd();
            },
            child: Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: () {
              _counterReset();
            },
            child: Icon(Icons.refresh),
          ),

          FloatingActionButton(
            onPressed: () {
              _countRemove();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}



