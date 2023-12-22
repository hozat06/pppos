import 'package:flutter/material.dart';
import 'package:pppos/pages/main_page.dart';

void main() {
  runApp(const PPPosApp());
}

class PPPosApp extends StatelessWidget {
  const PPPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Demo Page'),
    );
  }
}
