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
      return Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
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
