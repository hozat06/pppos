import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pppos/core/extensions/string_localize_extension.dart';
import 'package:pppos/core/managers/language_manager.dart';
import 'package:pppos/core/managers/languages.g.dart';
import 'package:pppos/custom_widgets/customer_text_field.dart';
import 'package:pppos/core/utilitys/theme.dart';

class LoginPageTabletView extends StatefulWidget {
  const LoginPageTabletView({super.key});

  @override
  State<LoginPageTabletView> createState() => _LoginPageTabletViewState();
}

class _LoginPageTabletViewState extends State<LoginPageTabletView> {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale(AppTheme.currentLocale),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.backColor,
          body: Row(
            children: [
              const Expanded(
                child: Text("webview"),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: 350.0,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    //page title
                    _title(),

                    //divider
                    AppTheme.divider,

                    //form
                    _form(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _form(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            LocaleKeys.loginPage_title.lang,
            style: AppTheme.title.copyWith(color: AppTheme.secondary),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CircleAvatar(
          backgroundColor: AppTheme.backColor,
          backgroundImage:
              const AssetImage('assets/images/logos/company_logo.png'),
          radius: 50,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          label: LocaleKeys.loginPage_emailText.lang,
          labelColor: AppTheme.textTextColor,
          icon: Icon(Icons.email_rounded, color: AppTheme.primary),
          borderColor: AppTheme.primary,
          backgroundColor: AppTheme.backColor,
          textColor: AppTheme.textTextColor,
          hintColor: AppTheme.textPlaceholderColor,
          borderRadius: 6,
          borderLineWidth: 2,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          label: LocaleKeys.loginPage_passwordText.lang,
          password: true,
          labelColor: AppTheme.textTextColor,
          icon: Icon(
            Icons.password_rounded,
            color: AppTheme.primary,
          ),
          borderColor: AppTheme.primary,
          backgroundColor: AppTheme.backColor,
          textColor: AppTheme.textTextColor,
          hintColor: AppTheme.textPlaceholderColor,
          borderRadius: 6,
          borderLineWidth: 2,
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            context.setLocale(
                context.locale != LanguageManager.instance.enLocale
                    ? LanguageManager.instance.enLocale
                    : LanguageManager.instance.trLocale);
            print(context.locale);
          },
          child: Text(LocaleKeys.loginPage_loginButton.lang),
        )
      ],
    );
  }

  Align _title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Image(
            image: AssetImage("assets/images/logos/logo.png"),
            height: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Propratik Restaurant, POS",
            style: AppTheme.title,
          ),
        ],
      ),
    );
  }
}
