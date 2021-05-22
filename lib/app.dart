import 'package:flutter/material.dart';
import 'package:thats_my_ball/ui/playground_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PlaygroundScreen(),
    );
  }
}
