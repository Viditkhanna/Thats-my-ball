import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/ui/playground_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      home: PlaygroundScreen(),
    );
  }
}
