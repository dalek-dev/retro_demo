import 'package:flutter/material.dart';

class SecondRocket extends StatefulWidget {
  const SecondRocket({super.key});

  @override
  State<SecondRocket> createState() => _SecondRocketState();
}

class _SecondRocketState extends State<SecondRocket>
    with TickerProviderStateMixin {
  late AnimationController _animationRocketController;
  late Animation<double> _animationRocket;
  @override
  void initState() {
    super.initState();
    _animationRocketController =
        AnimationController(vsync: this, duration: const Duration(seconds: 50));
    _animationRocket =
        Tween<double>(begin: 0, end: 800).animate(_animationRocketController);

    _animationRocketController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: size.height / 2,
          left: 113,
          child: AnimatedBuilder(
              animation: _animationRocketController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_animationRocket.value),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffd3fbff),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFa1dff0),
                          blurRadius: 7,
                          spreadRadius: 0.5,
                        )
                      ],
                    ),
                    height: _animationRocket.value,
                    width: 3,
                  ),
                );
              }),
        ),
        SizedBox(
          width: size.width,
          height: size.height,
          child: AnimatedBuilder(
              animation: _animationRocketController,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(-100, -_animationRocket.value),
                    child: Image.asset(
                      'assets/images/rocket.png',
                      scale: 3,
                    ));
              }),
        ),
      ],
    );
  }
}
