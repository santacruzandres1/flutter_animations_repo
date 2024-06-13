import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double size;
  final double strokeWidth;
  const RadialProgress({
    super.key,
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.size,
    required this.strokeWidth,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    super.initState();
    _initController();
    _initPorcentajeAnterior();
  }

    void _initController() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 40),
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
  }

  void _initPorcentajeAnterior() {
    porcentajeAnterior = widget.porcentaje;
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: _childInRadialProgressBuilder(diferenciaAnimar, controller),
        ),
        Center(
          child: Text(
            '${widget.porcentaje.toInt()}%',
            style: TextStyle(
              fontSize: widget.size / 5,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  Widget _childInRadialProgressBuilder(
      double diferencia, AnimationController controller) {
    return CustomPaint(
      painter: _MyRadialProgress(
        porcentaje:
            (widget.porcentaje - diferencia) + (diferencia * controller.value),
        colorPrimario: widget.colorPrimario,
        colorSecundario: widget.colorSecundario,
        strokeWidth: widget.strokeWidth,
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double strokeWidth;
  _MyRadialProgress({
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackgroundCircle(canvas, size);
    _drawProgressArc(canvas, size);
  }

  void _drawBackgroundCircle(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);
  }

  void _drawProgressArc(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = colorPrimario
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);
    final arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
