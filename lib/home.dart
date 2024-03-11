import 'package:bubble_trouble/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double X = 0;

  void moveLeft() {
    setState(() {
      X -= 0.1;
    });
  }

  void moveRight() {
    setState(() {
      X += 0.1;
    });
  }

  void fireMissle() {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blue[100],
            child: Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      alignment: Alignment(X, 1),
                      child: Container(
                        color: Colors.pink,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                  function: moveLeft,
                ),
                MyButton(
                  icon: Icons.arrow_upward,
                  function: fireMissle,
                ),
                MyButton(
                  icon: Icons.arrow_forward,
                  function: moveRight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}