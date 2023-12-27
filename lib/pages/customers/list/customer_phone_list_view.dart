import 'package:flutter/material.dart';

class CustomerPhoneListView extends StatefulWidget {
  const CustomerPhoneListView({super.key});

  @override
  State<CustomerPhoneListView> createState() => _CustomerPhoneListViewState();
}

class _CustomerPhoneListViewState extends State<CustomerPhoneListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const Text("data");
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 3.0,
        );
      },
      itemCount: 10,
    );
  }
}
