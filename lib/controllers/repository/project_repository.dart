import 'package:job_timer/models/entities/project.dart';
import 'package:job_timer/models/entities/project_status.dart';

abstract interface class ProjectRepository {
  Future<void> register(Project project);

  Future<List<Project>> findByStatus(ProjectStatus status);
  Future<void> update(Project project);
}
