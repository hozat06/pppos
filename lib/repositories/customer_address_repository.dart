import 'package:isar/isar.dart';
import 'package:pppos/managers/database_manager.dart';
import 'package:pppos/managers/exception_manager.dart';
import 'package:pppos/models/customer.dart';
import 'package:pppos/models/customer_address.dart';
import 'package:pppos/repositories/_base_repository.dart';

class CustomerAddressRepository extends DatabaseManager
    implements IBaseRepository<CustomerAddress> {
  @override
  Future<bool> add(CustomerAddress model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customerAddress.put(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> addAll(List<CustomerAddress> model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customerAddress.putAll(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> update(CustomerAddress model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customerAddress.put(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> delete(CustomerAddress model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customerAddress.delete(model.isarId ?? 0);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> deleteAll(List<CustomerAddress> model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        var ids = model.map((x) {
          return x.isarId;
        }).toList();

        await db.customerAddress.deleteAll(ids);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> deleteById(int id) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customerAddress.delete(id);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<List<CustomerAddress?>> getAll() async {
    try {
      var db = await isarDb;
      return db.customerAddress.where().findAll();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return [];
    }
  }

  @override
  Future<CustomerAddress?> getById(int id) async {
    try {
      var db = await isarDb;
      return await db.customerAddress.get(id);
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  @override
  Future<int> count() async {
    try {
      var db = await isarDb;
      return await db.customerAddress.count();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return 0;
    }
  }

  @override
  Future<CustomerAddress?> first() async {
    try {
      var db = await isarDb;
      return await db.customerAddress.where().findFirst();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  @override
  Future<void> save(CustomerAddress model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await model.customer.save();
      });
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
    }
  }

  //custom

  Future<List<CustomerAddress?>> getCutomerById(String customerId) async {
    try {
      var db = await isarDb;
      return db.customerAddress
          .filter()
          .customer((q) => q.idEqualTo(customerId))
          .findAll();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return [];
    }
  }

  Future<List<CustomerAddress?>> getCutomerByIsarId(int customerId) async {
    try {
      var db = await isarDb;
      return db.customerAddress
          .filter()
          .customer((q) => q.isarIdEqualTo(customerId))
          .findAll();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return [];
    }
  }

  Future<CustomerAddress?> getDefaultAddress(String customerId) async {
    try {
      var db = await isarDb;
      return await db.customerAddress
          .filter()
          .customer((q) => q.idEqualTo(customerId))
          .and()
          .isDefaultEqualTo(true)
          .findFirst();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }
}
