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
  static List<ParameterModel> defaultValues = [
    ParameterModel()
      ..code = ISLOGIN
      ..name = "IsLogin"
      ..value = false.toString()
      ..description = "Login control"
  ];
}
