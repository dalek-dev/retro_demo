import 'package:flutter/material.dart';

class NeonLine extends StatelessWidget {
  Color color;
  Color shadowColor;
  double blur;
  double width;
  double height;
  Gradient? gradient;
  NeonLine(
      {required this.color,
      required this.shadowColor,
      this.blur = 10.0,
      this.width = 1000,
      this.height = 5,
      this.gradient,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: blur,
            spreadRadius: blur,
            offset: const Offset(
              0.0,
              0.0,
            ),
          )
        ],
      ),
    );
  }
}
