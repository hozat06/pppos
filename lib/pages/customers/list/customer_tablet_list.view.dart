import 'package:flutter/material.dart';
import 'package:pppos/core/enums/device_types.dart';
import 'package:pppos/core/utilitys/helper.dart';

class CustomerTabletListView extends StatefulWidget {
  const CustomerTabletListView({super.key});

  @override
  State<CustomerTabletListView> createState() => _CustomerTabletListViewState();
}

class _CustomerTabletListViewState extends State<CustomerTabletListView> {
  int getCellCount(BoxConstraints constraints) {
    if (Helper.getDeviceType(constraints) == EDeviceTypes.Tablet) {
      return 3;
    } else if (Helper.getDeviceType(constraints) == EDeviceTypes.Desktop) {
      return 5;
    }

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCellCount(constraints)),
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: const Text("data"),
            ),
          );
        },
      );
    });
  }
}
