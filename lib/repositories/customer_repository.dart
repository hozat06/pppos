import 'package:isar/isar.dart';
import 'package:pppos/core/managers/database_manager.dart';
import 'package:pppos/core/managers/exception_manager.dart';
import 'package:pppos/models/entities/customer.dart';
import 'package:pppos/repositories/_base_repository.dart';

class CustomerRepository extends DatabaseManager
    implements IBaseRepository<Customer> {
  @override
  Future<bool> add(Customer model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customers.put(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> addAll(List<Customer> model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customers.putAll(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> update(Customer model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customers.put(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> delete(Customer model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.customers.delete(model.isarId ?? 0);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> deleteAll(List<Customer> model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        var ids = model.map((x) {
          return x.isarId;
        }).toList();

        await db.customers.deleteAll(ids);
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
        await db.customers.delete(id);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<List<Customer?>> getAll() async {
    try {
      var db = await isarDb;
      return db.customers.where().findAll();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return [];
    }
  }

  @override
  Future<Customer?> getById(int id) async {
    try {
      var db = await isarDb;
      return await db.customers.get(id);
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  @override
  Future<int> count() async {
    try {
      var db = await isarDb;
      return await db.customers.count();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return 0;
    }
  }

  @override
  Future<Customer?> first() async {
    try {
      var db = await isarDb;
      return await db.customers.where().findFirst();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  @override
  Future<void> save(Customer model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await model.address.save();
      });
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
    }
  }

//custom

  Future<List<Customer?>> search(String value) async {
    try {
      var db = await isarDb;
      return db.customers
          .filter()
          .nameContains(value)
          .or()
          .emailContains(value)
          .or()
          .phoneContains(value)
          .findAll();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return [];
    }
  }
}
