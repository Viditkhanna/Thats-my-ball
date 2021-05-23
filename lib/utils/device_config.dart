import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceConfig {
  static final _platform = Theme.of(Get.context).platform;

  static bool get isMobile {
    return _platform == TargetPlatform.iOS ||
        _platform == TargetPlatform.android;
  }

  static bool get isPC {
    return _platform == TargetPlatform.macOS ||
        _platform == TargetPlatform.linux ||
        _platform == TargetPlatform.windows;
  }

  static Size get size {
    return Get.size;
  }
}
