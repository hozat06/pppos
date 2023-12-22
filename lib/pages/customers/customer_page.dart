import 'package:flutter/material.dart';
import 'package:pppos/viewModels/customer_view_model.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({super.key}) {
    customerViewModel.getCustomers();
  }

  var customerViewModel = CustomerViewModel();

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Customer Page"),
          ElevatedButton(
            onPressed: () async {
              await widget.customerViewModel.createCustomers();
              await widget.customerViewModel.getCustomers();
            },
            child: const Text("Test Data Create"),
          )
        ],
      ),
    );
  }
}
