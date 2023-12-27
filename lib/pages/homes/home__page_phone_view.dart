import 'package:flutter/material.dart';

class HomePagePhoneView extends StatefulWidget {
  const HomePagePhoneView({super.key});

  @override
  State<HomePagePhoneView> createState() => _HomePagePhoneViewState();
}

class _HomePagePhoneViewState extends State<HomePagePhoneView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Phone view"),
        ),
      ),
    );
  }
}
