import 'package:flutter/material.dart';
import 'package:retro_demo/src/widgets/stars_background.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF201b4d),
              Color(0xff0681f9),
            ])),
        child: Stack(
          children: [
            Positioned(
                top: 30,
                right: 0,
                child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color(0xffd000416).withOpacity(0.5),
                          const Color(0xff201b4d).withOpacity(0.8),
                          const Color(0xff557a8c)
                        ],
                      ).createShader(bounds);
                    },
                    child: Image.asset(
                      'assets/images/moons.png',
                    ))),
            const StarsBackground(),
          ],
        ));
  }
}
