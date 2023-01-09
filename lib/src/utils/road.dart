import 'package:flutter/material.dart';

class Road extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final path = Path();

    var gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF9d55f5), Color(0xFF012d56)]);

    path.moveTo(size.width / 2 - 20, 430);
    path.lineTo(size.width / 2 - 12, 430);
    path.lineTo(size.width - 10, 1000);
    path.lineTo(0, 1000);

    paint.shader = gradient.createShader(Rect.fromPoints(
        const Offset(0, 50), Offset(size.width, size.height + 1000)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
