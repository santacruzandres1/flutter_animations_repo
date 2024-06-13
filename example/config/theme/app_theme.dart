import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const  seedColor = Colors.green;

    return ThemeData(
      colorSchemeSeed: seedColor,
    );
  }
}