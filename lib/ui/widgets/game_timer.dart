import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/game_timer_controller.dart';

class GameTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<GameTimerController>(
      init: Get.find<GameTimerController>(),
      builder: (gameTimerController) {
        return Text('TIME: ${gameTimerController.timerDuration}');
      },
    );
  }
}
