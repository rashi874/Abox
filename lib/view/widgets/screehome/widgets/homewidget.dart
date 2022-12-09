import 'dart:math';

import 'package:flutter/material.dart';

class Downloadsimagewigdtes extends StatelessWidget {
  const Downloadsimagewigdtes({
    Key? key,
    required this.kimage,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String kimage;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            ///  margin: margin,
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(kimage),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
