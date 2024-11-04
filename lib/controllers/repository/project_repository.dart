import 'package:job_timer/models/project.dart';

abstract interface class ProjectRepository {
  Future<void> register(Project project);
  
}
