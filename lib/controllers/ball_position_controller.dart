import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_state_controller.dart';

class BallPositionController extends GetxController {
  final _random = Random();
  final GameStateController gameStateCtrl = Get.find();
  StreamSubscription gameStateStream;
  var _topMargin = 0.0.obs;
  var _leftMargin = 0.0.obs;

  int _positionChangeSpeed = 700; // In Milliseconds

  BallPositionController() {
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

  void _initialize() {
    _positionChangeSpeed = 700; // For when game is restarted
    changePosition();
  }

  double get topMargin => _topMargin.value;

  double get leftMargin => _leftMargin.value;

  void changePosition() async {
    final size = Get.size;
    var cornerPadding =
        ((size.height * 0.2) + AppBar().preferredSize.height).toInt();
    _topMargin.value =
        _random.nextInt(size.height.toInt() - cornerPadding).toDouble();
    _leftMargin.value =
        _random.nextInt(size.width.toInt() - cornerPadding).toDouble();
    changeSpeed();
  }

  void changeSpeed() async {
    await Future.delayed(Duration(milliseconds: _positionChangeSpeed));
    if (gameStateCtrl.currentState == GameState.END) return;
    _positionChangeSpeed -= 2;
    changePosition();
  }

  @override
  void dispose() {
    gameStateStream?.cancel();
    super.dispose();
  }
}
