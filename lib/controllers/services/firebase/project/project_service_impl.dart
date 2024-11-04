import 'package:job_timer/controllers/models/project_model.dart';
import 'package:job_timer/controllers/repository/project_repository_impl.dart';
import 'package:job_timer/models/project.dart';

import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepositoryImpl _projectRepository;

  ProjectServiceImpl({
    required ProjectRepositoryImpl projectRepository,
  }) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel model) async {
    final project = Project(
      name: model.name,
      status: model.status,
      estimate: model.estimate,
      uid: model.uid,
    );
    await _projectRepository.register(project);
  }
}
