import 'package:flutter/material.dart';

class LanguageManager {
  static const String LANG_ASSET_PATH = "assets/languages";

  final trLocale = const Locale("tr", "TR");
  final enLocale = const Locale("en", "US");

  static LanguageManager _instance = LanguageManager._init();
  static LanguageManager get instance {
    return _instance ??= LanguageManager._init();
  }

  LanguageManager._init();

  List<Locale> get supportedLocales => [trLocale, enLocale];
}
