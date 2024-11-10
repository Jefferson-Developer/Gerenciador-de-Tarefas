import 'package:job_timer/models/entities/project.dart';

abstract interface class ProjectRepository {
  Future<void> register(Project project);
  
}
