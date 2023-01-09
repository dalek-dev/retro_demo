import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_demo/src/utils/road.dart';
import 'package:retro_demo/src/widgets/background.dart';
import 'package:retro_demo/src/widgets/border_left.dart';
import 'package:retro_demo/src/widgets/border_right.dart';
import 'package:retro_demo/src/widgets/car.dart';
import 'package:retro_demo/src/widgets/ground.dart';
import 'package:retro_demo/src/widgets/neon_line.dart';
import 'package:retro_demo/src/widgets/rocket.dart';
import 'package:retro_demo/src/widgets/second_border_left.dart';
import 'package:retro_demo/src/widgets/second_border_right.dart';
import 'package:retro_demo/src/widgets/second_rocket.dart';
import 'package:retro_demo/src/widgets/sun.dart';
import 'package:retro_demo/src/widgets/third_border_left.dart';
import 'package:retro_demo/src/widgets/third_border_right.dart';

class RetroScreen extends StatefulWidget {
  const RetroScreen({super.key});

  @override
  State<RetroScreen> createState() => _RetroScreenState();
}

class _RetroScreenState extends State<RetroScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          const Sun(),
          const SecondRocket(),
          const Rocket(),
          const Ground(),
          Positioned(
              top: size.height / 2 - 110,
              child: Image.asset(
                'assets/images/mountains.png',
                width: 480,
              )),
          Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: Road(),
                child: Container(),
              )),
          Positioned(
              top: size.height,
              left: -470,
              child: Transform.rotate(
                  angle: 109 * pi / 180,
                  child: NeonLine(
                    color: Colors.white,
                    shadowColor: const Color(0xFF9d55f5).withOpacity(0.0),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFd415d2).withOpacity(0.5),
                          const Color(0xff7dcae2),
                          const Color(0xff7dcae2)
                        ]),
                    blur: 3,
                  ))),
          Positioned(
              top: size.height,
              left: -120,
              child: Transform.rotate(
                  angle: 69.5 * pi / 180,
                  child: NeonLine(
                      color: Colors.white,
                      shadowColor: const Color(0xFF9d55f5).withOpacity(0.0),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            const Color(0xFFd415d2).withOpacity(0.5),
                            const Color(0xff7dcae2),
                            const Color(0xff7dcae2)
                          ]),
                      blur: 3))),
          const BorderRight(),
          const SecondBorderRight(),
          const SecondBorderLeft(),
          const BorderLeft(),
          const ThirdBorderLeft(),
          const ThirdBorderRight(),
          Positioned(
              top: size.height / 2 - 5,
              child: NeonLine(
                color: const Color(0xffd3fbff),
                shadowColor: const Color(0xFFa1dff0),
              )),
          const Car(),
        ],
      ),
    );
  }
}
