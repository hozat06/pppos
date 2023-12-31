import 'package:flutter/material.dart';
import 'package:pppos/core/enums/device_types.dart';

class Helper {
  static GlobalKey<NavigatorState> appContext = GlobalKey<NavigatorState>();

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

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Helper.appContext.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(Helper.appContext.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(Helper.appContext.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showWarningSnackBar(String message) {
    ScaffoldMessenger.of(Helper.appContext.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange.shade400,
      ),
    );
  }

  static void hideCurrentSnackBar() {
    ScaffoldMessenger.of(Helper.appContext.currentContext!)
        .hideCurrentSnackBar();
  }
}
