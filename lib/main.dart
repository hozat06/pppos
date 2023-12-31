import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pppos/core/managers/language_manager.dart';
import 'package:pppos/core/utilitys/helper.dart';
import 'package:pppos/models/apps_models/parameter_model.dart';
import 'package:pppos/pages/homes/home_page.dart';
import 'package:pppos/pages/login/login_page.dart';
import 'package:pppos/repositories/parameter_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //dil desteğini aktif et
  await EasyLocalization.ensureInitialized();

  //cihaz dilini çek
  var defaultLocale = Platform.localeName;

  //default paremetre değerlerini dbye kaydet
  ParameterRepository().defaultValueSave(upt: true);

  //splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(EasyLocalization(
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: LanguageManager.LANG_ASSET_PATH,
    startLocale: Locale(defaultLocale),
    child: const ProviderScope(child: PPPosApp()),
  ));
}

class PPPosApp extends StatefulWidget {
  const PPPosApp({super.key});

  @override
  State<PPPosApp> createState() => _PPPosAppState();
}

class _PPPosAppState extends State<PPPosApp> {
  bool isLogin = false;

  @override
  void initState() {
    ParameterRepository().getCode(ParameterModel.ISLOGIN).then((login) => {
          if (login != null)
            {
              if (bool.tryParse(login.value, caseSensitive: true) == true)
                {
                  setState(() {
                    isLogin = true;
                  })
                }
            }
        });
    initialization();
    super.initState();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Helper.appContext,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: isLogin ? const HomePage() : const LoginPage()),
    );
  }
}
