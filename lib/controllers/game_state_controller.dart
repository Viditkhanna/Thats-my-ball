import 'package:get/get.dart';

enum GameState { PLAYING, PAUSE, END }

class GameStateController extends GetxController {
  var _currentState = GameState.PLAYING.obs;

  GameState get currentState => _currentState.value;

  void pauseGame() {
    _currentState.value = GameState.PAUSE;
  }

  void resumeGame() {
    _currentState.value = GameState.PLAYING;
  }

  void stopGame() {
    _currentState.value = GameState.END;
  }
}
