import 'package:flutter/foundation.dart';

class ExceptionManager {
  static void ExceptionLog(Object e) {
    if (kDebugMode) {
      print(e);
    }

    //logla
  }
}
