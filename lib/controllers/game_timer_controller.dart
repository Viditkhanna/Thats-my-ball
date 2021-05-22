import 'dart:async';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/game_state_controller.dart';

class GameTimerController extends GetxController {
  StreamSubscription gameStateStream;

  GameTimerController() {
    _listenToGameState();
  }

  void _listenToGameState() {
    final GameStateController gameStateCtrl = Get.find();
    ever<GameState>(gameStateCtrl.stateRx, (state) {
      if (state == GameState.START) {
        _initialize();
      }
    });
  }

  final RxInt _timerDuration = 60.obs;

  void _initialize() {
    _timerDuration.value = 60; // For when game is restarted
    startTimer();
  }

  final GameStateController gameTimerController = Get.find();

  Timer _timer;

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
