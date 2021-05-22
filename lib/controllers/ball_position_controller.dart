import 'dart:math';
import 'package:get/get.dart';
import 'game_state_controller.dart';

class BallPositionController extends GetxController {
  final _random = Random();
  final GameStateController gameStateCtrl = Get.find();

  var _topMargin = 0.0.obs;
  var _leftMargin = 0.0.obs;

  int _positionChangeSpeed = 1000; // In Milliseconds

  BallPositionController() {
    changePosition();
  }

  double get topMargin => _topMargin.value;

  double get leftMargin => _leftMargin.value;

  void changePosition() async {
    final size = Get.size;
    _topMargin.value = _random.nextInt(size.height.toInt() - 200).toDouble();
    _leftMargin.value = _random.nextInt(size.width.toInt() - 200).toDouble();
    changeSpeed();
  }

  void changeSpeed() async {
    await Future.delayed(Duration(milliseconds: _positionChangeSpeed));
    if (gameStateCtrl.currentState == GameState.END) return;
    _positionChangeSpeed -= 2;
    changePosition();
  }
}
