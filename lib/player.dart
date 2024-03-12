import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  final double X;

  const MyPlayer({required this.X});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(X, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'lib/images/mushroom.png',
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
