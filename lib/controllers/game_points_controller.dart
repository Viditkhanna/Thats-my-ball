import 'package:get/get.dart';

class GamePointsController extends GetxController {
  var _points = 0.obs;

  int get points => _points.value;

  set points(val) {
    _points.value = val;
  }
}
