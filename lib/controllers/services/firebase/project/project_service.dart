import 'package:job_timer/models/models/project_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel project);
}