import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_demo/src/widgets/neon_line.dart';

class ThirdBorderRight extends StatefulWidget {
  const ThirdBorderRight({super.key});

  @override
  State<ThirdBorderRight> createState() => _ThirdBorderRightState();
}

class _ThirdBorderRightState extends State<ThirdBorderRight>
    with TickerProviderStateMixin {
  late AnimationController _animationBorderController;
  late Animation<double> _animationBorder;

  @override
  void initState() {
    super.initState();
    _animationBorderController = AnimationController(
        vsync: this, duration: const Duration(seconds: 500));
    _animationBorder =
        Tween<double>(begin: -497, end: 0).animate(_animationBorderController);

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
          right: -92,
          child: AnimatedBuilder(
              animation: _animationBorderController,
              builder: ((context, child) {
                return Transform.rotate(
                    angle: 69.5 * pi / 180,
                    child: Transform.translate(
                      offset: Offset(_animationBorder.value, 100),
                      child: NeonLine(
                        width: 70,
                        color: const Color(0xFFd3fbff),
                        shadowColor: const Color(0xFFa1dff0).withOpacity(0.3),
                      ),
                    ));
              })),
        ),
      ],
    );
  }
}
