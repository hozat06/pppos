import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  late Id isarId = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  String? id;

  int? role;

  @Index(type: IndexType.value, unique: true)
  String? code;

  @Index(type: IndexType.value)
  String? name;

  @Index(type: IndexType.value)
  String? email;

  @Index(type: IndexType.value)
  String? phone;

  String? department;
  String? password;
  bool? isPanelAccessible;
  bool? isWebOrderAccessible;
  bool? isPosAccessible;
  bool? isActive;
  String? companyId;
  String? storeId;

  User(
      {this.id,
      this.role,
      this.code,
      this.name,
      this.email,
      this.phone,
      this.department,
      this.password,
      this.isPanelAccessible,
      this.isWebOrderAccessible,
      this.isPosAccessible,
      this.isActive,
      this.companyId,
      this.storeId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    code = json['code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    department = json['department'];
    password = json['password'];
    isPanelAccessible = json['isPanelAccessible'];
    isWebOrderAccessible = json['isWebOrderAccessible'];
    isPosAccessible = json['isPosAccessible'];
    isActive = json['isActive'];
    companyId = json['companyId'];
    storeId = json['storeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['role'] = role;
    data['code'] = code;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['department'] = department;
    data['password'] = password;
    data['isPanelAccessible'] = isPanelAccessible;
    data['isWebOrderAccessible'] = isWebOrderAccessible;
    data['isPosAccessible'] = isPosAccessible;
    data['isActive'] = isActive;
    data['companyId'] = companyId;
    data['storeId'] = storeId;
    return data;
  }
}
