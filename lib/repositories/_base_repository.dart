abstract class IBaseRepository<T> {
  Future<bool> add(T model);
  Future<bool> addAll(List<T> model);

  Future<bool> update(T model);

  Future<bool> delete(T model);
  Future<bool> deleteAll(List<T> model);
  Future<bool> deleteById(int id);

  ///Isar.autoIncrement ide ye göre Data getirir.
  Future<T?> getById(int id);
  Future<List<T?>> getAll();

  Future<void> save(T model);

  //tools
  Future<T?> first();
  Future<int> count();
}
