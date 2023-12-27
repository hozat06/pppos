import 'package:flutter/material.dart';
import 'package:pppos/core/utilitys/theme.dart';

class LoginPagePhoneView extends StatefulWidget {
  const LoginPagePhoneView({super.key});

  @override
  State<LoginPagePhoneView> createState() => _LoginPagePhoneViewState();
}

class _LoginPagePhoneViewState extends State<LoginPagePhoneView> {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale(AppTheme.currentLocale),
      child: const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(""),
          ),
        ),
      ),
    );
  }
}
