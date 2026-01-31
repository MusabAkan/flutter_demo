import 'package:flutter/material.dart';
import 'package:flutter_application_1/color_picker_page.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class MyAppSelectColorWidget extends StatelessWidget {
  const MyAppSelectColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.themeData(), home: ColorPickerPage());
  }
}
