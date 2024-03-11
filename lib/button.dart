import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final icon;
  
  const MyButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.brown,
        width: 50,
        height: 50,
        child: Center(child: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
    );
  }
}