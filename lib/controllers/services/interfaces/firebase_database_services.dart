abstract class IFirebaseDatabaseServices<T> {
  Future<List<T>> getAll();
  Future<void> delete({required String uid});
  Future<void> update({required T data});
  Future<void> create({
    required T data,
  });
}
