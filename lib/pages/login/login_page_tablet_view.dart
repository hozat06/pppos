import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pppos/core/extensions/string_localize_extension.dart';
import 'package:pppos/core/managers/language_manager.dart';
import 'package:pppos/core/managers/languages.g.dart';
import 'package:pppos/core/utilitys/theme.dart';
import 'package:pppos/custom_widgets/customer_text_field.dart';
import 'package:pppos/viewModels/login_view_model.dart';

class LoginPageTabletView extends StatefulWidget {
  const LoginPageTabletView({super.key});

  @override
  State<LoginPageTabletView> createState() => _LoginPageTabletViewState();
}

class _LoginPageTabletViewState extends State<LoginPageTabletView> {
  final viewModel = LoginViewModel();

  void changeLanguage(Locale lang) {
    context.setLocale(lang);
  }

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
                    borderRadius: const BorderRadius.all(Radius.zero),
                    color: Colors.grey.shade200),
                child: SingleChildScrollView(
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
        CircleAvatar(
          backgroundColor: AppTheme.backColor,
          backgroundImage:
              const AssetImage('assets/images/logos/company_logo.png'),
          radius: 50,
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.loginPage_title.lang,
            style: AppTheme.title.copyWith(color: AppTheme.secondary),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          label: LocaleKeys.loginPage_emailText.lang,
          controller: viewModel.userCodeController,
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
          controller: viewModel.passwordCodeController,
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
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  textStyle: AppTheme.font,
                  fixedSize: const Size.fromHeight(45),
                ),
                onPressed: () async {
                  await viewModel.login();
                },
                child: Text(LocaleKeys.loginPage_loginButton.lang),
              ),
            ),
            IconButton(
              onPressed: () =>
                  changeLanguage(LanguageManager.instance.trLocale),
              icon: const Image(
                image: AssetImage("assets/languages/icons/tr-TR.png"),
              ),
            ),
            IconButton(
              onPressed: () =>
                  changeLanguage(LanguageManager.instance.enLocale),
              icon: const Image(
                image: AssetImage("assets/languages/icons/en-US.png"),
              ),
            ),
          ],
        )
      ],
    );
  }

  Row _title() {
    return Row(
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
    );
  }
}
