import 'dart:async';

import 'package:bubble_trouble/button.dart';
import 'package:bubble_trouble/missile.dart';
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
  double mH = 10;
  bool midShot = false;

  void moveLeft() {
    setState(() {
      if (X -0.1 < -1) {

      } else {
        X -= 0.1;
      }
      if (!midShot) {
        mX = X;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (X +0.1 > 1) {

      } else {
        X += 0.1;
      }
      mX = X;
    });
  }

  void fireMissile() {
    if (midShot == false) {
      Timer.periodic(Duration(milliseconds: 20), (timer){
        midShot = true;
        setState(() {
          mH += 10;
        });
        if (mH > MediaQuery.of(context).size.height * 3/4) {
          resetMissile();
          timer.cancel();
          midShot = false;
        }
      });
    }
  }

  void resetMissile () {
    mX = X;
    mH = 10;
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
          fireMissile();
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
                    MyMissile(
                      height: mH,
                      mX: mX,
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
                    function: fireMissile,
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