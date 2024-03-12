import 'dart:math';

import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  final double bX;
  final double bY;

  const MyBall({required this.bX, required this.bY});

  @override
  Widget build(BuildContext context) {
    Color randomColor() {
      Random random = Random();
      int red = 100 + random.nextInt(156);
      int green = 100 + random.nextInt(156);
      int blue = 100 + random.nextInt(156);
      return Color.fromRGBO(
        red,
        green,
        blue,
        1.0,
      );
    }

    return Container(
      alignment: Alignment(bX, bY),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: randomColor(),
        ),
      ),
    );
  }
}
