import 'package:flutter/material.dart';
import 'package:pppos/core/enums/device_types.dart';
import 'package:pppos/pages/login/login_page_phone_view.dart';
import 'package:pppos/pages/login/login_page_tablet_view.dart';
import 'package:pppos/core/utilitys/helper.dart';

class LoginPage extends StatefulWidget {
  final LoginPagePhoneView phoneView = const LoginPagePhoneView();
  final LoginPageTabletView tabletView = const LoginPageTabletView();
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Helper.getDeviceType(constraints) == EDeviceTypes.Phone) {
          return widget.phoneView;
        } else {
          return widget.tabletView;
        }
      },
    );
  }
}
