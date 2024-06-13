import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../animations/radial_progress.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final double? size;
  final double? strokeWidth;
  final double initialPercentage;
  final Color? color;
  final Color? background;
  final bool isLoading;
  final ValueNotifier<bool>? isCompleteNotifier; 

  const CustomCircularProgressIndicator({
    super.key,
    this.size = 200,
    this.strokeWidth,
    this.initialPercentage = 0.0,
    this.color,
    this.background,
    this.isLoading = false,
    this.isCompleteNotifier, 
  });

  @override
  CustomCircularProgressIndicatorState createState() => CustomCircularProgressIndicatorState();
}

class CustomCircularProgressIndicatorState extends State<CustomCircularProgressIndicator> {
  double porcentaje = 0.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    porcentaje = widget.initialPercentage;
    if (widget.isLoading) {
      _startLoading();
    }
  }

  @override
  void didUpdateWidget(CustomCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading && !oldWidget.isLoading) {
      _startLoading();
    } else if (!widget.isLoading && oldWidget.isLoading) {
      _stopLoading();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startLoading() {
    porcentaje = 0.0; // Reiniciar el porcentaje
    if (widget.isCompleteNotifier != null) {
      widget.isCompleteNotifier!.value = false; 
    }
    double baseIncrement = 1;
    double time = 0;
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        time += 0.1;
        double increment = baseIncrement + sin(time) * baseIncrement;
        porcentaje += increment;
        if (porcentaje >= 100) {
          porcentaje = 100;
          if (widget.isCompleteNotifier != null) {
            widget.isCompleteNotifier!.value = true; 
          }
          timer.cancel();
        }
      });
    });
  }

  void _stopLoading() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: RadialProgress(
        porcentaje: porcentaje,
        size: widget.size ?? 200,
        strokeWidth: widget.strokeWidth ?? widget.size! / 15,
        colorPrimario: widget.color ?? colors.primary,
        colorSecundario: widget.background ?? colors.surfaceDim,
      ),
    );
  }
}
