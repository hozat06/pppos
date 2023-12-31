import 'package:flutter/material.dart';
import 'package:pppos/models/apps_models/parameter_model.dart';
import 'package:pppos/pages/login/login_page.dart';
import 'package:pppos/repositories/parameter_repository.dart';

class HomePagePhoneView extends StatefulWidget {
  const HomePagePhoneView({super.key});

  @override
  State<HomePagePhoneView> createState() => _HomePagePhoneViewState();
}

class _HomePagePhoneViewState extends State<HomePagePhoneView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IconButton(
            onPressed: () async {
              ParameterRepository()
                  .updateWithByCode(ParameterModel.ISLOGIN, false.toString());

              ParameterRepository().updateWithByCode(ParameterModel.TOKEN, "");

              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
            },
            icon: const Icon(Icons.power_settings_new_rounded),
          ),
        ),
      ),
    );
  }
}
