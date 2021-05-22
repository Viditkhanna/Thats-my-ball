import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/ball_position_controller.dart';
import 'package:thats_my_ball/controllers/game_points_controller.dart';
import 'package:thats_my_ball/controllers/game_state_controller.dart';
import 'package:thats_my_ball/ui/widgets/game_over_card.dart';
import 'package:thats_my_ball/ui/widgets/welcome_card.dart';
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
    listenToGameEnd();
  }

  Future showWelcomeDialog() async {
    await Future(() {});
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: WelcomeCard(),
          );
        });
  }

  listenToGameEnd() {
    final GameStateController gameStateCtrl = Get.find();
    ever<GameState>(gameStateCtrl.stateRx, (state) {
      if (state == GameState.END) {
        showEndGameDialog();
      }
    });
  }

  Future showEndGameDialog() async {
    await Future(() {});
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: GameOverCard(),
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
