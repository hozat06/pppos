import 'package:flutter/material.dart';
import 'package:pppos/core/enums/device_types.dart';
import 'package:pppos/core/utilitys/helper.dart';
import 'package:pppos/viewModels/customer_view_model.dart';

class CustomerPage extends StatefulWidget {
  final Widget mobileView;
  final Widget tabletView;

  CustomerPage(
      {super.key, required this.mobileView, required this.tabletView}) {
    customerViewModel.getCustomers();
  }

  var customerViewModel = CustomerViewModel();

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Helper.getDeviceType(constraints) == EDeviceTypes.Phone) {
          return widget.mobileView;
        } else {
          return widget.tabletView;
        }
      },
    );
  }
}
