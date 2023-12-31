import 'dart:convert';
import 'dart:io';

import 'package:pppos/core/managers/exception_manager.dart';
import 'package:pppos/core/utilitys/constants.dart';
import 'package:pppos/models/request_models/auth_request_model.dart';
import 'package:pppos/models/response_models/_base_response_model.dart';
import 'package:pppos/models/response_models/auth_response_model.dart';
import 'package:pppos/services/_base_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:http/http.dart' as http;

class AuthService extends BaseService {
  Future<BaseResponseModel<AuthResponseModel?>> login(
      AuthRequestModel model) async {
    try {
      var url =
          "${await getBaseUrl}${Constants.AUTHS}${sprintf(Constants.AUTHS_LOGIN, [
            model.code,
            model.password
          ])}";

      var response = await http.post(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok) {
        var auth =
            AuthResponseModel.fromJson(jsonDecode(response.body)["data"]);
        var result = BaseResponseModel<AuthResponseModel?>.fromJson(
            jsonDecode(response.body));
        result.data = auth;
        return result;
      } else {
        return BaseResponseModel.error(response.body);
      }
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return BaseResponseModel.error(e.toString());
    }
  }
}
