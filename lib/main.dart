import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/controllers/game_state_controller.dart';
import 'package:thats_my_ball/controllers/game_timer_controller.dart';

import 'app.dart';
import 'controllers/ball_position_controller.dart';
import 'controllers/game_points_controller.dart';

void main() {
  Get.put(GameStateController());
  Get.put(BallPositionController());
  Get.put(GameTimerController());
  Get.put(GamePointsController());
  runApp(MyApp());
}
