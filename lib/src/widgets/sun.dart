import 'package:flutter/material.dart';

class Sun extends StatefulWidget {
  const Sun({super.key});

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> with TickerProviderStateMixin {
  late AnimationController _animationSunController;
  late Animation<double> _animationSun;

  @override
  void initState() {
    super.initState();
    _animationSunController =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
    _animationSun =
        Tween<double>(begin: 280, end: 120).animate(_animationSunController);

    _animationSunController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      left: 80,
      right: 80,
      child: AnimatedBuilder(
          animation: _animationSunController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animationSun.value),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFd415d2),
                      Color(0xff7dcae2),
                      Color(0xff7dcae2)
                    ],
                  ).createShader(bounds);
                },
                child: Image.asset(
                  'assets/images/sun.png',
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }
}
