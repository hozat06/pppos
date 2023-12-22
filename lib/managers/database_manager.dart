import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pppos/models/customer.dart';
import 'package:pppos/models/customer_address.dart';

class DatabaseManager {
  late Future<Isar> isarDb;

  DatabaseManager() {
    isarDb = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          CustomerSchema,
          CustomerAddressSchema,
        ],
        name: "ppposdb",
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance("ppposdb"));
  }
}


/*
  isar collection olarak işaretlenen class için generate class yaratır.
  dart run build_runner build
*/