import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final icon;
  final function;

  const MyButton({this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.grey[900],
          width: 50,
          height: 50,
          child: Center(child: Icon(icon, color: Colors.white,)),
        ),
      ),
    );
  }
}