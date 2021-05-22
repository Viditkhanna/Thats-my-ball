import 'package:flutter/material.dart';
import 'dart:math';
import 'widgets/game_timer.dart';

class PlaygroundScreen extends StatefulWidget {
  @override
  _PlaygroundScreenState createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  double topMargin = 0;
  double leftMargin = 0;
  int points = 0;
  int positionChangeSpeed = 1000; // In Milliseconds
  final random = Random();
  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    changePosition();
  }

  void changePosition() async {
    await Future(() {});
    final size = MediaQuery.of(context).size;
    topMargin = random.nextInt(size.height.toInt() - 100).toDouble();
    leftMargin = random.nextInt(size.width.toInt() - 100).toDouble();
    changeSpeed();
    setState(() {});
  }

  void changeSpeed() async {
    await Future.delayed(Duration(milliseconds: positionChangeSpeed));
    if (isGameOver) return;
    positionChangeSpeed -= 2;
    changePosition();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: GameTimer(
          onTimeOver: () {
            isGameOver = true;
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'POINTS:  $points',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: topMargin, left: leftMargin),
        child: InkWell(
          hoverColor: Colors.blue.withOpacity(0.4),
          splashColor: Colors.blue.withOpacity(0.8),
          borderRadius: BorderRadius.circular(40),
          onTap: isGameOver
              ? null
              : () {
                  points += 10;
                  setState(() {});
                },
          child: Ink(
            height: size.height * 0.1,
            width: size.height * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
