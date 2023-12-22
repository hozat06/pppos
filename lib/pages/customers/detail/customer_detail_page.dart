// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({Key? key}) : super(key: key);

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Customer Detail"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.save_as_outlined))
          ],
        ),
        body: const Center(
          child: Text("Customer Page"),
        ));
  }
}

/**
 * Column(children: [
        Expanded(
          child: Column(children: [
            ListTile(
              title: CustomTextField(
                label: "Name",
                icon: const Icon(Icons.person_outline),
                borderRadius: 8.0,
                borderLineWidth: 2.0,
                backgroundColor: Colors.white,
                controller: widget.nameController,
              ),
            ),
            ListTile(
              title: CustomTextField(
                label: "Email",
                icon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                borderRadius: 8.0,
                borderLineWidth: 2.0,
                backgroundColor: Colors.white,
                controller: widget.emailController,
              ),
            ),
            ListTile(
              title: CustomTextField(
                label: "Phone",
                icon: const Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                borderRadius: 8.0,
                borderLineWidth: 2.0,
                backgroundColor: Colors.white,
                controller: widget.phoneController,
              ),
            ),
            ListTile(
              title: CustomTextField(
                label: "Password",
                icon: const Icon(Icons.password_outlined),
                password: true,
                keyboardType: TextInputType.visiblePassword,
                borderRadius: 8.0,
                borderLineWidth: 2.0,
                backgroundColor: Colors.white,
                controller: widget.passwordController,
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      enableDrag: true,
                      showDragHandle: true,
                      isDismissible: false,
                      builder: (BuildContext context) {
                        return const CustomerAddressDetailPopupPage();
                      },
                    );
                  },
                  icon: const Icon(Icons.add_location_alt_outlined))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.separated(
            itemCount: widget.customer.address?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('item $index'),
              );
            },
          ),
        )
      ]),
 * 
 */
