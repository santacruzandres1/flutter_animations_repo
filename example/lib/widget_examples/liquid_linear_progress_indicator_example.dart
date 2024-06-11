import 'package:design_aplication/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LiquidLinearProgressIndicatorExample extends StatefulWidget {
  const LiquidLinearProgressIndicatorExample({super.key});

  @override
  LiquidLinearProgressIndicatorExampleState createState() =>
      LiquidLinearProgressIndicatorExampleState();
}

class LiquidLinearProgressIndicatorExampleState
    extends State<LiquidLinearProgressIndicatorExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _waveAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAnimatedBuilder(),
    );
  }

  Widget _buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _waveAnimation,
      builder: (context, child) {
        return Center(
          child: SizedBox(
            width: 300.0,
            height: 30.0,
            child: _buildLiquidLinearProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget _buildLiquidLinearProgressIndicator() {
    return LiquidLinearProgressIndicator(
      value: _waveAnimation.value,
      valueColor: const AlwaysStoppedAnimation(Colors.blue),
      backgroundColor: Colors.grey.shade200,
      borderColor: Colors.blue,
      borderWidth: 5.0,
      borderRadius: 12.0,
      center: Container(),
    );
  }
}
