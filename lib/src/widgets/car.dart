import 'package:flutter/material.dart';

class Car extends StatefulWidget {
  const Car({super.key});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> with TickerProviderStateMixin {
  late AnimationController _animationCarController;
  late Animation<double> _animationCar;

  @override
  void initState() {
    super.initState();
    _animationCarController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationCar =
        Tween<double>(begin: 0, end: 1).animate(_animationCarController);

    _animationCarController.repeat();
  }

  @override
  void dispose() {
    _animationCarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -70,
          right: 0,
          left: -80,
          child: Image.asset(
            'assets/images/rim_left.png',
            scale: 4,
          ),
        ),
        Positioned(
          bottom: -33,
          right: -80,
          left: 0,
          child: Image.asset(
            'assets/images/rim_right.png',
            scale: 4,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _animationCarController,
            builder: ((context, child) {
              return Transform.translate(
                offset: Offset(0, _animationCar.value),
                child: child,
              );
            }),
            child: Image.asset(
              'assets/images/car_case.png',
              scale: 4.5,
            ),
          ),
        ),
      ],
    );
  }
}
