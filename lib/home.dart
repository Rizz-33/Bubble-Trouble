import 'package:bubble_trouble/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blue[100],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.brown[400],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  icon: Icons.arrow_back,
                ),
                MyButton(
                  icon: Icons.arrow_upward,
                ),
                MyButton(
                  icon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}