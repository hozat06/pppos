// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'parameter_model.g.dart';

@collection
class ParameterModel {
  late Id isarId = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  late String code;

  @Index(type: IndexType.value)
  late String name;

  late String value;
  String? description;

  ParameterModel();

  static const String ISLOGIN = "isLogin";
  static const String API_URL = "apiUrl";
  static const String TOKEN = "token";
  static const String EXPRIED_DATE = "expriedDate";
  static List<ParameterModel> defaultValues = [
    ParameterModel()
      ..code = ISLOGIN
      ..name = "IsLogin"
      ..value = false.toString()
      ..description = "Login control",
    ParameterModel()
      ..code = API_URL
      ..name = "Api Url"
      ..value = "http://95.70.151.20:1001/api"
      ..description = "Api base url",
    ParameterModel()
      ..code = TOKEN
      ..name = "Token"
      ..value = ""
      ..description = "User Auth Login Token Key",
    ParameterModel()
      ..code = EXPRIED_DATE
      ..name = "Expried Date"
      ..value = ""
      ..description = "User Auth Login Token expried Date"
  ];
}
