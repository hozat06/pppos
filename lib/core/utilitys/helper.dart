import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pppos/core/enums/device_types.dart';

class Helper {
  static EDeviceTypes getDeviceType(BoxConstraints constraints) {
    double width = constraints.maxWidth;

    if (width < 500) {
      return EDeviceTypes.Phone;
    } else if (width < 1100) {
      return EDeviceTypes.Tablet;
    } else {
      return EDeviceTypes.Desktop;
    }
  }
}
