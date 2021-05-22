import 'dart:async';

import 'package:flutter/material.dart';

class GameTimer extends StatefulWidget {
  final Function() onTimeOver;

  const GameTimer({Key key, this.onTimeOver}) : super(key: key);

  @override
  _GameTimerState createState() => _GameTimerState();
}

class _GameTimerState extends State<GameTimer> {
  Timer timer;
  int timerDuration = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timerDuration--;
      if (timerDuration == 0) {
        widget.onTimeOver();
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('TIME: $timerDuration');
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
