import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String currentLocale = "en";

  static Color primary = const Color(0xfff05b41);
  static Color secondary = Colors.grey.shade800;
  static Color backColor = Colors.white;
  static Color textTextColor = Colors.black;
  static Color textPlaceholderColor = Colors.grey.shade500;

  static TextStyle title = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primary,
  );

  static Widget divider = Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Divider(
      height: 1,
      color: Colors.grey.shade400,
    ),
  );
}
