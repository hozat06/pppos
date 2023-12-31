import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pppos/core/extensions/string_localize_extension.dart';
import 'package:pppos/core/managers/language_manager.dart';
import 'package:pppos/core/managers/languages.g.dart';
import 'package:pppos/core/managers/riverpod_manager.dart';
import 'package:pppos/core/utilitys/theme.dart';
import 'package:pppos/custom_widgets/customer_keyboard.dart';
import 'package:pppos/custom_widgets/customer_text_field.dart';
import 'package:pppos/viewModels/login_view_model.dart';

class LoginPagePhoneView extends ConsumerStatefulWidget {
  const LoginPagePhoneView({super.key});

  @override
  ConsumerState<LoginPagePhoneView> createState() => _LoginPagePhoneViewState();
}

class _LoginPagePhoneViewState extends ConsumerState<LoginPagePhoneView> {
  late LoginViewModel viewModelRef;
  late LoginViewModel viewModelWatch;
  int selectedTextfield = 0;
  void selecteTextfield(int index) {
    setState(() {
      if (index >= viewModelRef.controllers.length) {
        index = viewModelRef.controllers.length - 1;
      }
      selectedTextfield = index;
    });
  }

  void changeLanguage(Locale lang) {
    context.setLocale(lang);
  }

  @override
  Widget build(BuildContext context) {
    viewModelRef = ref.read(loginViewModel);
    viewModelWatch = ref.watch(loginViewModel);

    return Localizations.override(
      context: context,
      locale: Locale(AppTheme.currentLocale),
      child: Scaffold(
        backgroundColor: AppTheme.backColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //page title
                _title(),

                //divider
                AppTheme.divider,

                //form
                _form(context),

                //keyboard
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Visibility(
                    visible: Platform.isWindows || Platform.isMacOS,
                    child: CustomerKeyboard(
                        controller:
                            viewModelRef.controllers[selectedTextfield]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _form(BuildContext context) {
    loginTab() async => await viewModelRef.login();

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
          controller: viewModelRef.controllers[0],
          labelColor: AppTheme.textTextColor,
          icon: Icon(Icons.email_rounded, color: AppTheme.primary),
          borderColor: AppTheme.primary,
          backgroundColor: AppTheme.backColor,
          textColor: AppTheme.textTextColor,
          hintColor: AppTheme.textPlaceholderColor,
          borderRadius: 6,
          borderLineWidth: 2,
          autofocus: true,
          onTap: () => selecteTextfield(0),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          label: LocaleKeys.loginPage_passwordText.lang,
          controller: viewModelRef.controllers[1],
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
          onTap: () => selecteTextfield(1),
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
                onPressed: viewModelWatch.isLoading ? null : loginTab,
                child: viewModelWatch.isLoading
                    ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                            color: AppTheme.backColor))
                    : Text(LocaleKeys.loginPage_loginButton.lang),
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
        ),
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
