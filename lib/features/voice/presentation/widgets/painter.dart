import 'dart:math';

import 'package:flutter/material.dart';

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;

  SpritePainter(this._animation, this._color) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = _color.withOpacity(opacity);

    double size = rect.width;
    double area = size * size;
    double radius = sqrt(area * value);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
