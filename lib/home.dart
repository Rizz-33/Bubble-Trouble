import 'dart:async';

import 'package:bubble_trouble/button.dart';
import 'package:bubble_trouble/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double X = 0;
  double mX = X;
  double mY = 1;
  double mH = 10;

  void moveLeft() {
    mX = X;
    setState(() {
      if (X -0.1 < -1) {

      } else {
        X -= 0.1;
      }
    });
  }

  void moveRight() {
    setState(() {
      mX = X;
      if (X +0.1 > 1) {

      } else {
        X += 0.1;
      }
    });
  }

  void fireMissle() {
    Timer.periodic(Duration(milliseconds: 20), (timer){
      setState(() {
        mH += 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
        if (event.isKeyPressed(LogicalKeyboardKey.space)) {
          fireMissle();
        }
        
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue[100],
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(mX, mY),
                      child: Container(
                        width: 2,
                        height: mH,
                        color: Colors.brown[300],
                      ),
                    ),
                    MyPlayer(
                      X: X,
                    ),
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
      ),
    );
  }
}