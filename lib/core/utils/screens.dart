import 'package:flutter/material.dart';

import '../enums/device_type.dart';



extension DeviceTypeExtension on BuildContext {
  DeviceType get deviceType {
    final double width = MediaQuery.of(this).size.width;

    if (width >= 1024) {
      return DeviceType.desktop;
    } else if (width >= 500) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
}
