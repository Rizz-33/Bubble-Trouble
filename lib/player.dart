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
          'lib/images/slime.png',
          height: 80,
          width: 80,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
