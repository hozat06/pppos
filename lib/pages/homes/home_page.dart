// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pppos/core/enums/device_types.dart';

import 'package:pppos/pages/homes/home__page_phone_view.dart';
import 'package:pppos/pages/homes/home__page_tablet_view.dart';
import 'package:pppos/core/utilitys/helper.dart';

class HomePage extends StatefulWidget {
  final HomePagePhoneView phoneView = const HomePagePhoneView();
  final HomePageTabletView tabletView = const HomePageTabletView();
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (Helper.getDeviceType(constraints) == EDeviceTypes.Phone) {
            return widget.phoneView;
          } else {
            return widget.tabletView;
          }
        },
      ),
    );
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
