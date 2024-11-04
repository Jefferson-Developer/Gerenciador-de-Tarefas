import 'package:job_timer/controllers/models/project_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel project);
}