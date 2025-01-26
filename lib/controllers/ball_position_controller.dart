import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/controllers.dart';
import 'package:thats_my_ball/utils/device_config.dart';

class BallPositionController extends GetxController {
  final _random = Random();
  final GameStateController gameStateCtrl = Get.find();

  var _topMargin = 0.0.obs;
  var _leftMargin = 0.0.obs;
  var defaultSpeed = 0; // In Milliseconds

  int _positionChangeSpeed = 0;

  BallPositionController() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      defaultSpeed = DeviceConfig.isPC ? 700 : 500;
      _positionChangeSpeed = defaultSpeed;
    });
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
    _positionChangeSpeed = defaultSpeed; // For when game is restarted
    changePosition();
  }

  double get topMargin => _topMargin.value;

  double get leftMargin => _leftMargin.value;

  void changePosition() async {
    final size = DeviceConfig.size;
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
}
