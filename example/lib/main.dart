import 'package:flutter/material.dart';
import 'widget_examples/liquid_linear_progress_indicator_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: LiquidLinearProgressIndicatorExample(),
    );
  }
}
