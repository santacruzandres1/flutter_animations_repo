import 'package:flutter/material.dart';

import '../config/theme/app_theme.dart';
import 'widget_examples/widget_exmples.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: _homeBuilder(),
    );
  }

  Widget _homeBuilder() {
    return const SafeArea(
      child: CustomCircularProgressIndicatorExample(),
      );
  }
}
