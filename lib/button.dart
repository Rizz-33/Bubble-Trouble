import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      width: 50,
      height: 50,
      child: Text("data"),
    );
  }
}