import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pppos/core/utilitys/theme.dart';
import 'package:pppos/pages/login/login_page_phone_view.dart';

class LoginPageTabletView extends ConsumerStatefulWidget {
  const LoginPageTabletView({super.key});

  @override
  ConsumerState<LoginPageTabletView> createState() =>
      _LoginPageTabletViewState();
}

class _LoginPageTabletViewState extends ConsumerState<LoginPageTabletView> {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale(AppTheme.currentLocale),
      child: Scaffold(
        body: Row(
          children: [
            const Expanded(
              child: Text("webview"),
            ),
            Container(
              color: AppTheme.backColor,
              width: 400,
              child: const LoginPagePhoneView(),
            ),
          ],
        ),
      ),
    );
  }
}
