import 'package:get/get.dart';

enum GameState { IDLE, START, PAUSE, END }

class GameStateController extends GetxController {
  var _currentState = GameState.IDLE.obs;

  GameState get currentState => _currentState.value;

  Rx<GameState> get stateRx => _currentState;

  void startGame() => _currentState.value = GameState.START;

  void pauseGame() => _currentState.value = GameState.PAUSE;

  void stopGame() => _currentState.value = GameState.END;
}
