import 'package:flutter/material.dart';
import 'package:pppos/models/customer.dart';
import 'package:pppos/repositories/customer_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Customer> customers = [];
  CustomerRepository customerRepository = CustomerRepository();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Page"));
  }
}

/*Column(
        children: [
          const Text("Home Page"),
          ElevatedButton(
            onPressed: () async {
              var random = Random();
              var id = random.nextInt(100).toString();
              var customer =
                  Customer(id: id, name: "Ali Haydar", isActive: true)
                    ..phone = "5326451865"
                    ..email = "alihaydar@mail.com"
                    ;

              var result = await customerRepository.add(customer);
              if (result != null && result) {
                var snackBar =
                    const SnackBar(content: Text('Yay! A SnackBar!'));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text('Save Customer'),
          ),
          ElevatedButton(
            onPressed: () async {
              await getList();
            },
            child: const Text('Get All'),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: customers?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(customers[index].name),
                    subtitle: Text(customers[index].id),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CustomerDetailPage(customer: customers[index]),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),*/
