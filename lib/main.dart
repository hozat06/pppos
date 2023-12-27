import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pppos/core/managers/language_manager.dart';
import 'package:pppos/models/parameter_model.dart';
import 'package:pppos/pages/homes/home_page.dart';
import 'package:pppos/pages/login/login_page.dart';
import 'package:pppos/repositories/parameter_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //dil desteğini aktif et
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //default paremetre değerlerini dbye kaydet
  ParameterRepository().defaultValueSave(upt: true);

  runApp(EasyLocalization(
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: LanguageManager.LANG_ASSET_PATH,
    child: const PPPosApp(),
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: false,
      ),
      home: isLogin ? const HomePage() : const LoginPage(),
    );
  }
}
