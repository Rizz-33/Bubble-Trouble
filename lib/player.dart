import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {

  final X;

  const MyPlayer({this.X});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        alignment: Alignment(X, 1),
        child: Container(
          color: Colors.pink,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}