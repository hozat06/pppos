// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:pppos/core/extensions/string_localize_extension.dart';
import 'package:pppos/core/managers/exception_manager.dart';
import 'package:pppos/core/managers/languages.g.dart';
import 'package:pppos/core/utilitys/helper.dart';
import 'package:pppos/models/apps_models/parameter_model.dart';
import 'package:pppos/models/request_models/auth_request_model.dart';
import 'package:pppos/pages/homes/home_page.dart';
import 'package:pppos/repositories/parameter_repository.dart';
import 'package:pppos/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final _parameterReposiyory = ParameterRepository();
  final _authService = AuthService();
  //final userCodeController = TextEditingController();
  //final passwordCodeController = TextEditingController();
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController()
  ];
  bool isLoading = false;

  final BuildContext _context = Helper.appContext.currentContext!;
  LoginViewModel();

  Future<void> login() async {
    try {
      if (controllers[0].text == "" || controllers[1].text == "") {
        Helper.showErrorSnackBar(
            LocaleKeys.loginPage_message_validationError.lang);
        return;
      }

      isLoading = true;
      ChangeNotifier();
      var model = AuthRequestModel.codeLogin(
        int.parse(controllers[0].text),
        controllers[1].text,
      );
      var result = await _authService.login(model);
      if (result.isStatus) {
        await _parameterReposiyory.updateWithByCode(
            ParameterModel.TOKEN, result.data?.token ?? "");
        await _parameterReposiyory.updateWithByCode(
            ParameterModel.ISLOGIN, true.toString());

        Helper.showSuccessSnackBar(
            LocaleKeys.loginPage_message_successLogin.lang);
        Navigator.pop(_context);
        Navigator.push(_context,
            MaterialPageRoute(builder: (context) => const HomePage()));

        controllers[0].text = "";
        controllers[1].text = "";
      } else {
        Helper.showWarningSnackBar(jsonDecode(result.message)["message"]);
      }
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
    }

    isLoading = false;
    ChangeNotifier();
  }
}
