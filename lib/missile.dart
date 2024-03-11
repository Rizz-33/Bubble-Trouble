import 'package:flutter/material.dart';

class MyMissile extends StatelessWidget {

  final height;
  final mX;

  const MyMissile({this.height, this.mX});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(mX, 1),
      child: Container(
        width: 2,
        height: height,
        color: Colors.brown[300],
      ),
    );
  }
}