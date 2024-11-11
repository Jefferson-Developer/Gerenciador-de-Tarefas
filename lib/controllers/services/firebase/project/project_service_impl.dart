import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/models/project_model.dart';
import 'package:job_timer/controllers/repository/project_repository_impl.dart';
import 'package:job_timer/models/entities/project.dart';

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

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStatus(status);
    return projects.map((project) => ProjectModel.fromEntity(project)).toList();
  }

  @override
  Future<void> update(ProjectModel model) async {
    final project = Project(
      name: model.name,
      status: model.status,
      estimate: model.estimate,
      uid: model.uid,
      tasks: model.tasks.map((task) => task.toEntity()).toList(),
    );
    await _projectRepository.update(project);
  }
}
