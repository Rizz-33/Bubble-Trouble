import 'dart:async';

import 'package:bubble_trouble/ball.dart';
import 'package:bubble_trouble/button.dart';
import 'package:bubble_trouble/missile.dart';
import 'package:bubble_trouble/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

enum Direction { LEFT, RIGHT }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double X = 0;
  double mX = 0;
  double mH = 10;
  bool midShot = false;
  double bX = 0.5;
  double bY = 1;
  var ballDirection = Direction.LEFT;
  int score = 0;

  void startGame() {
    double time = 0;
    double height = 0;
    double velocity = 60;

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = -5 * time * time + velocity * time;
      if (height < 0) {
        time = 0;
      }

      setState(() {
        bY = heightToCoordinate(height);
      });

      if (bX - 0.005 < -1) {
        ballDirection = Direction.RIGHT;
      } else if (bX + 0.005 > 1) {
        ballDirection = Direction.LEFT;
      }
      if (ballDirection == Direction.LEFT) {
        setState(() {
          bX -= 0.005;
        });
      } else if (ballDirection == Direction.RIGHT) {
        setState(() {
          bX += 0.005;
        });
      }

      if (playerOut()) {
        timer.cancel();
        _showDialog();
      }

      time += 0.1;
    });
  }

void _showDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 209, 238, 20),
        title: Center(
          child: Text(
            "You've Lost!",
            style: GoogleFonts.pressStart2p(
              decoration: TextDecoration.none,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        content: Text(
          "Do you want to restart the game?",
          style: GoogleFonts.pressStart2p(
            decoration: TextDecoration.none,
            fontSize: 8.0,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              restartGame();
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: Text(
              "Restart",
              style: GoogleFonts.pressStart2p(
                decoration: TextDecoration.none,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}


  void moveLeft() {
    setState(() {
      if (X - 0.1 < -1) {
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
      if (X + 0.1 > 1) {
      } else {
        X += 0.1;
      }
      if (!midShot) {
        mX = X;
      }
    });
  }

  void fireMissile() {
    if (midShot == false) {
      Timer.periodic(Duration(milliseconds: 20), (timer) {
        midShot = true;
        setState(() {
          mH += 10;
        });
        if (mH > MediaQuery.of(context).size.height * 3 / 4) {
          resetMissile();
          timer.cancel();
        }
        if (bY > heightToCoordinate(mH) && (bX - mX).abs() < 0.03) {
          resetMissile();
          bX = 5;
          timer.cancel();
          setState(() {
            score += 1;
          });
        }
        if (mH >= MediaQuery.of(context).size.height * 3 / 4) {
          resetMissile();
          timer.cancel();
        }
      });
    }
  }

  double heightToCoordinate(double height) {
    double totalH = MediaQuery.of(context).size.height * 3 / 4;
    double position = 1 - 2 * height / totalH;
    return position;
  }

  void resetMissile() {
    mX = X;
    mH = 0;
    midShot = false;
  }

  bool playerOut() {
    if ((bX - X).abs() < 0.05 && bY > 0.95) {
      return true;
    } else {
      return false;
    }
  }

  void restartGame() {
    setState(() {
      X = 0;
      mX = X;
      mH = 10;
      midShot = false;
      bX = 0.5;
      bY = 1;
      ballDirection = Direction.LEFT;
      score = 0;
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
          fireMissile();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[800],
              child: Stack(
                children: [
                  MyBall(bX: bX, bY: bY),
                  MyMissile(height: mH, mX: mX),
                  MyPlayer(X: X),
                  Positioned(
                    top: 50.0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Bubble Trouble',
                        style: GoogleFonts.pressStart2p(
                          decoration: TextDecoration.none,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 209, 238, 20),
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Score: $score',
                        style: GoogleFonts.pressStart2p(
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(icon: Icons.play_arrow, function: startGame),
                      MyButton(icon: Icons.arrow_back, function: moveLeft),
                      MyButton(icon: Icons.arrow_upward, function: fireMissile),
                      MyButton(icon: Icons.arrow_forward, function: moveRight),
                      MyButton(icon: Icons.restart_alt, function: restartGame),
                    ],
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
