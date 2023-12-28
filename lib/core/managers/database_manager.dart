import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pppos/models/apps_models/parameter_model.dart';
import 'package:pppos/models/entities/customer.dart';
import 'package:pppos/models/entities/customer_address.dart';
import 'package:pppos/models/entities/user.dart';

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
          ParameterModelSchema,
          CustomerSchema,
          CustomerAddressSchema,
          UserSchema
        ],
        name: "ppposdb",
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance("ppposdb"));
  }
}
