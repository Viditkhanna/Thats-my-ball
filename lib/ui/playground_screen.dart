import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/ball_position_controller.dart';
import 'package:thats_my_ball/controllers/game_points_controller.dart';
import 'package:thats_my_ball/controllers/game_state_controller.dart';
import 'widgets/game_timer.dart';

class PlaygroundScreen extends StatefulWidget {
  @override
  _PlaygroundScreenState createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  @override
  void initState() {
    super.initState();
    showWelcomeDialog();
  }

  Future showWelcomeDialog() async {
    await Future(() {});
    final GameStateController gameStateCtrl = Get.find();
    final textTheme = Theme.of(context).textTheme;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Welcome to 'THAT'S MY BALL'",
                        style: textTheme.headline4,
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Click on the ball as many time as you can to get the maximum score',
                        style: textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        gameStateCtrl.startGame();
                      },
                      child: Text('CONTINUE'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final GameStateController gameStateController = Get.find();
    final GamePointsController gamePointsCtrl = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: GameTimer(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<GamePointsController>(
          builder: (gamePointsCtrl) => Text(
            'POINTS:  ${gamePointsCtrl.points}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: GetX<BallPositionController>(
        builder: (ballPosition) => Container(
          margin: EdgeInsets.only(
            top: ballPosition.topMargin,
            left: ballPosition.leftMargin,
          ),
          child: InkWell(
            hoverColor: Colors.blue.withOpacity(0.4),
            splashColor: Colors.blue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(40),
            onTap: gameStateController.currentState == GameState.START
                ? () {
                    gamePointsCtrl.points = gamePointsCtrl.points + 10;
                  }
                : null,
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
      ),
    );
  }
}
