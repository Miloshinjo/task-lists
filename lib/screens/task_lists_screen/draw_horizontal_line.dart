import 'package:flutter/material.dart';

class DrawHorizontalLine extends CustomPainter {
  Paint _paint;
  bool reverse;

  DrawHorizontalLine(this.reverse) {
    _paint = Paint()
      ..color = Colors.grey[300]
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!reverse) {
      canvas.drawLine(Offset(0.0, 0.0), Offset(80.0, 0.0), _paint);
    } else {
      canvas.drawLine(Offset(-80.0, 0.0), Offset(0.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
