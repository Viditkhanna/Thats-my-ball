import 'dart:async';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/game_state_controller.dart';

class GameTimerController extends GetxController {
  StreamSubscription gameStateStream;

  GameTimerController() {
    final GameStateController gameStateCtrl = Get.find();
    ever<GameState>(gameStateCtrl.stateRx, (state) {
      if (state == GameState.START) {
        startTimer();
      }
    });
  }

  final GameStateController gameTimerController = Get.find();

  Timer _timer;
  var _timerDuration = 60.obs;

  int get timerDuration => _timerDuration.value;

  set timerDuration(val) {
    _timerDuration.value = val;
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timerDuration--;
      if (timerDuration == 0) {
        gameTimerController.stopGame();
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    gameStateStream?.cancel();
    _timer?.cancel();
    super.dispose();
  }
}
