import 'package:pppos/repositories/customer_address_repository.dart';
import 'package:pppos/repositories/customer_repository.dart';
import 'package:pppos/services/entities/customer.dart';
import 'package:pppos/services/entities/customer_address.dart';

class CustomerViewModel {
  final customerRepository = CustomerRepository();
  final customerAddressRepository = CustomerAddressRepository();

  late Customer? currentCustomer;
  late List<Customer?> customers;

  CustomerViewModel() {
    getCustomers();
  }

  Future<void> createCustomers() async {
    for (var i = 1; i <= 5; i++) {
      var _customer = Customer()
        ..id = i.toString()
        ..name = "Test $i"
        ..email = "test$i@mail.com"
        ..password = "test$i"
        ..isActive = true
        ..phone = "";

      var address1 = CustomerAddress()
        ..id = "{$i}_1"
        ..name = "Home"
        ..isDefault = true
        ..isActive = true
        ..customer.value = _customer;

      var address2 = CustomerAddress()
        ..id = "{$i}_2"
        ..name = "Business"
        ..isDefault = false
        ..isActive = true
        ..customer.value = _customer;

      _customer.address.add(address1);
      _customer.address.add(address2);

      await customerRepository.add(_customer);
      await customerAddressRepository.add(address1);
      await customerAddressRepository.add(address2);

      await customerRepository.save(_customer);
      await customerAddressRepository.save(address1);
      await customerAddressRepository.save(address2);
    }
  }

  Future<void> getCustomers() async {
    customers = await customerRepository.getAll();

    customers.forEach((element) {
      print(element?.name ?? "customer name yok");
      print(element?.address ?? "customer name yok");
    });
  }

  Future<void> setCustomer(int id) async {
    currentCustomer = await customerRepository.getById(id);
  }
}
