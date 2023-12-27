import 'package:flutter/material.dart';

class HomePageTabletView extends StatefulWidget {
  const HomePageTabletView({super.key});

  @override
  State<HomePageTabletView> createState() => _HomePageTabletViewState();
}

class _HomePageTabletViewState extends State<HomePageTabletView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Tablet view"),
        ),
      ),
    );
  }
}
