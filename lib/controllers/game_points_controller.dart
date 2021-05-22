import 'package:get/get.dart';

import 'game_state_controller.dart';

class GamePointsController extends GetxController {
  GamePointsController() {
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

  _initialize() {
    _points.value = 0; // For when game is restarted
  }

  final RxInt _points = 0.obs;

  int get points => _points.value;

  set points(val) {
    _points.value = val;
  }
}
