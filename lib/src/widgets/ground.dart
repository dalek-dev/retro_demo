import 'package:flutter/material.dart';

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> with TickerProviderStateMixin {
  late AnimationController _animationGroundController;
  late Animation<double> _animationGround;

  @override
  void initState() {
    super.initState();
    _animationGroundController =
        AnimationController(vsync: this, duration: const Duration(seconds: 22));
    _animationGround =
        Tween<double>(begin: 0, end: 23).animate(_animationGroundController);

    _animationGroundController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -39,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
          animation: _animationGroundController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animationGround.value),
              child: Image.asset(
                'assets/images/ground.png',
                scale: 1,
              ),
            );
          }),
    );
  }
}
