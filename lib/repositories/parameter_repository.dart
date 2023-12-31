import 'package:isar/isar.dart';
import 'package:pppos/core/managers/database_manager.dart';
import 'package:pppos/core/managers/exception_manager.dart';
import 'package:pppos/models/apps_models/parameter_model.dart';
import 'package:pppos/repositories/_base_repository.dart';

class ParameterRepository extends DatabaseManager
    implements IBaseRepository<ParameterModel> {
  @override
  Future<bool> add(ParameterModel model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.parameterModels.put(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> addAll(List<ParameterModel> model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.parameterModels.putAll(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> update(ParameterModel model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.parameterModels.put(model);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> delete(ParameterModel model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        await db.parameterModels.delete(model.isarId ?? 0);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<bool> deleteAll(List<ParameterModel> model) async {
    try {
      var db = await isarDb;
      await db.writeTxn(() async {
        var ids = model.map((x) {
          return x.isarId;
        }).toList();

        await db.parameterModels.deleteAll(ids);
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
        await db.parameterModels.delete(id);
      });

      return true;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  @override
  Future<List<ParameterModel?>> getAll() async {
    try {
      var db = await isarDb;
      return db.parameterModels.where().findAll();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return [];
    }
  }

  @override
  Future<ParameterModel?> getById(int id) async {
    try {
      var db = await isarDb;
      return await db.parameterModels.get(id);
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  @override
  Future<int> count() async {
    try {
      var db = await isarDb;
      return await db.parameterModels.count();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return 0;
    }
  }

  @override
  Future<ParameterModel?> first() async {
    try {
      var db = await isarDb;
      return await db.parameterModels.where().findFirst();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  @override
  Future<void> save(ParameterModel model) async {}

  //custom
  Future<bool> updateWithByCode(String code, String value) async {
    try {
      var db = await isarDb;
      var parameter =
          await db.parameterModels.filter().codeEqualTo(code).findFirst();
      if (parameter != null) {
        parameter.value = value;
        return await update(parameter);
      }
      return false;
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return false;
    }
  }

  Future<ParameterModel?> getCode(String code) async {
    try {
      var db = await isarDb;
      return await db.parameterModels.filter().codeEqualTo(code).findFirst();
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }

  void defaultValueSave({bool upt = false}) async {
    try {
      ParameterModel.defaultValues.forEach((element) async {
        var item = await getCode(element.code);
        if (item == null) {
          await add(element);
        } else if (upt) {
          element.isarId = item!.isarId;
          await update(element);
        }
      });
    } catch (e) {
      ExceptionManager.ExceptionLog(e);
      return null;
    }
  }
}
