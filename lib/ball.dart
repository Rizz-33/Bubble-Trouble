import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  final double bX;
  final double bY;

  const MyBall({required this.bX, required this.bY});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(bX, bY),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}