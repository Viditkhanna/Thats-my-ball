import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/controllers.dart';

class GameOverCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameStateController gameStateCtrl = Get.find();
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "The Developer thanks you for playing 'THAT'S MY BALL'",
                  textAlign: TextAlign.center,
                  style: textTheme.headline4,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'The game is under development, stay tuned for more.',
                  style: textTheme.headline6,
                ),
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  gameStateCtrl.startGame();
                },
                child: Text('PLAY AGAIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
