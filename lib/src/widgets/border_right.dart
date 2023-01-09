import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_demo/src/widgets/neon_line.dart';

class BorderRight extends StatefulWidget {
  const BorderRight({super.key});

  @override
  State<BorderRight> createState() => _BorderRightState();
}

class _BorderRightState extends State<BorderRight>
    with TickerProviderStateMixin {
  late AnimationController _animationBorderController;
  late Animation<double> _animationBorder;

  @override
  void initState() {
    super.initState();
    _animationBorderController =
        AnimationController(vsync: this, duration: const Duration(seconds: 13));
    _animationBorder =
        Tween<double>(begin: -220, end: 0).animate(_animationBorderController);

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
    return Positioned(
      top: size.height,
      right: -132,
      child: AnimatedBuilder(
          animation: _animationBorderController,
          builder: ((context, child) {
            return Transform.rotate(
                angle: 69.5 * pi / 180,
                child: Transform.translate(
                  offset: Offset(_animationBorder.value, 100),
                  child: NeonLine(
                    width: 150,
                    color: const Color(0xFFd3fbff),
                    shadowColor: const Color(0xFFa1dff0).withOpacity(0.3),
                  ),
                ));
          })),
    );
  }
}
