import 'package:flutter/material.dart';
import 'package:pppos/core/managers/exception_manager.dart';
import 'package:pppos/models/request_models/auth_request_model.dart';
import 'package:pppos/services/auth_service.dart';

class LoginViewModel {
  final _authService = AuthService();
  final userCodeController = TextEditingController();
  final passwordCodeController = TextEditingController();

  Future<void> login() async {
    try {
      if (userCodeController.text == "" || passwordCodeController.text == "") {
        print("Form boş!!");
        return;
      }

      var model = AuthRequestModel.codeLogin(
        int.parse(userCodeController.text),
        passwordCodeController.text,
      );
      var result = await _authService.login(model);
      if (result.isStatus) {
      } else {
        print(result.message);
      }
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
    }
  }
}
