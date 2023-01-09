import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_demo/src/widgets/neon_line.dart';

class SecondBorderLeft extends StatefulWidget {
  const SecondBorderLeft({super.key});

  @override
  State<SecondBorderLeft> createState() => _SecondBorderLeftState();
}

class _SecondBorderLeftState extends State<SecondBorderLeft>
    with TickerProviderStateMixin {
  late AnimationController _animationBorderController;
  late Animation<double> _animationBorder;

  @override
  void initState() {
    super.initState();
    _animationBorderController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));
    _animationBorder = Tween<double>(begin: -370, end: 100)
        .animate(_animationBorderController);

    _animationBorderController.repeat();
  }

  @override
  void dispose() {
    _animationBorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: size.height,
          left: 61,
          child: AnimatedBuilder(
              animation: _animationBorderController,
              builder: (context, child) {
                return Transform.rotate(
                    angle: 109 * pi / 180,
                    child: Transform.translate(
                      offset: Offset(_animationBorder.value, 100),
                      child: NeonLine(
                        width: 150,
                        color: const Color(0xFFd3fbff),
                        shadowColor: const Color(0xFFa1dff0).withOpacity(0.3),
                      ),
                    ));
              }),
        ),
      ],
    );
  }
}
