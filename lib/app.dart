import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thats_my_ball/resources/app_theme.dart';
import 'package:thats_my_ball/ui/playground_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.get(),
      home: PlaygroundScreen(),
    );
  }
}
