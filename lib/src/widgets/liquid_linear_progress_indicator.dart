import 'package:flutter/material.dart';

import '../animations/wave_animation.dart';



class LiquidLinearProgressIndicator extends ProgressIndicator {
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? center;
  final Axis direction;

  LiquidLinearProgressIndicator({
    super.key,
    double super.value = 0.5,
    super.backgroundColor,
    Animation<Color>? super.valueColor,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.center,
    this.direction = Axis.horizontal,
  }) {
    if ((borderWidth != null && borderColor == null) ||
        (borderColor != null && borderWidth == null)) {
      throw ArgumentError("borderWidth and borderColor should both be set.");
    }
  }

  Color _getBackgroundColor(BuildContext context) =>
      backgroundColor ?? Theme.of(context).colorScheme.surface;

  Color _getValueColor(BuildContext context) =>
      valueColor?.value ?? Theme.of(context).colorScheme.secondary;

  @override
  State<StatefulWidget> createState() => _LiquidLinearProgressIndicatorState();
}
class _LiquidLinearProgressIndicatorState
    extends State<LiquidLinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final percentage = (widget.value! * 100).toStringAsFixed(0);
    final textColor = widget.value! < 0.4 ? Colors.black : Colors.white;
    final textColorPercentage =
        widget.value! < 0.45 ? Colors.black : Colors.white;

    return ClipPath(
      clipper: _LinearClipper(
        radius: widget.borderRadius,
      ),
      child: CustomPaint(
        painter: _LinearPainter(
          color: widget._getBackgroundColor(context),
          radius: widget.borderRadius ?? 0,
        ),
        foregroundPainter: _LinearBorderPainter(
          color: widget.borderColor ?? Colors.black,
          width: widget.borderWidth ?? 0,
          radius: widget.borderRadius ?? 0,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Wave(
              value: widget.value,
              color: widget._getValueColor(context),
              direction: widget.direction,
            ),
            if (widget.center != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          percentage,
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "%",
                          style: TextStyle (color: textColorPercentage),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _LinearPainter extends CustomPainter {
  final Color color;
  final double radius;

  _LinearPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
        paint);
  }

  @override
  bool shouldRepaint(_LinearPainter oldDelegate) => color != oldDelegate.color;
}

class _LinearBorderPainter extends CustomPainter {
  final Color color;
  final double width;
  final double radius;

  _LinearBorderPainter({
    required this.color,
    required this.width,
    required this.radius,
  });

@override
void paint(Canvas canvas, Size size) {
  final paint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

  final rect = Rect.fromLTWH(
      width / 2, width / 2, size.width - width, size.height - width);

  canvas.drawRect(rect, paint);
}

  @override
  bool shouldRepaint(_LinearBorderPainter oldDelegate) =>
      color != oldDelegate.color ||
      width != oldDelegate.width ||
      radius != oldDelegate.radius;
}

class _LinearClipper extends CustomClipper<Path> {
  final double? radius;

  _LinearClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius ?? 0),
        ),
      );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
