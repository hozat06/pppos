import 'package:pppos/models/apps_models/parameter_model.dart';
import 'package:pppos/repositories/parameter_repository.dart';

class BaseService {
  static String? _baseUrl;
  static String? _token;
  static DateTime? expriedDate;

  final parameterService = ParameterRepository();

  BaseService() {
    parameterService
        .getCode(ParameterModel.API_URL)
        .then((model) => _baseUrl = model?.value);

    parameterService
        .getCode(ParameterModel.TOKEN)
        .then((model) => _token = model?.value);
  }

  Future<String?> get getBaseUrl async {
    if (_baseUrl != "") return _baseUrl;

    var model = await parameterService.getCode(ParameterModel.API_URL);
    if (model != null) {
      _baseUrl = model.value;
      return _baseUrl;
    }

    throw ArgumentError.value("BaseUrl is null!");
  }

  Future<String?> get getToken async {
    if (_token != "") return _token;

    var model = await parameterService.getCode(ParameterModel.TOKEN);
    if (model != null) {
      _token = "Bearer $model.value";
      return _token;
    }

    throw ArgumentError.value("Token is null!");
  }
}
