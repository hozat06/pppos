// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:pppos/services/entities/customer_address.dart';

part 'customer.g.dart';

@collection
class Customer {
  late Id isarId = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  late String id;

  @Index(type: IndexType.value)
  late String name;

  String? email;
  String? phone;
  String? password;

  bool? isActive;

  final address = IsarLinks<CustomerAddress>();
}
