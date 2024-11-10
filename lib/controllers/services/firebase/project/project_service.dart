import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/models/project_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel project);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
}