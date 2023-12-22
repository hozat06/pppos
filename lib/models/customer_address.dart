import 'package:isar/isar.dart';
import 'package:pppos/models/customer.dart';

part 'customer_address.g.dart';

@collection
class CustomerAddress {
  late Id isarId = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  late String id;

  @Index(type: IndexType.value)
  late String name;

  String? detail;
  String? city;
  String? county;
  String? zipCode;
  late bool isDefault = false;
  late bool isActive;

  @Backlink(to: "address")
  final customer = IsarLink<Customer>();
}
