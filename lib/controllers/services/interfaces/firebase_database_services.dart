import 'package:job_timer/models/entities/project_status.dart';

abstract class IFirebaseDatabaseServices<T> {
  Future<List<T>> getAll();
  Future<List<T>> findByStatus(ProjectStatus status);
  Future<void> delete({required String uid});
  Future<void> update({required T data});
  Future<void> create({
    required T data,
  });
}
