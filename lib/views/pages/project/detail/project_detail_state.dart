import 'package:flutter/material.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/models/project_model.dart';

class ProjectDetailState extends ChangeNotifier {
  final ProjectServiceImpl _projectService;
  ProjectModel project;
  ProjectDetailState({
    required ProjectServiceImpl projectService,
    required this.project,
  }) : _projectService = projectService {
    projectNotifier = ValueNotifier(project);
  }

  late ValueNotifier<ProjectModel> projectNotifier;

  void updateProject(ProjectModel project) {
    projectNotifier.value = project;
    notifyListeners();
  }

  Future<void> changeStatus() async {
    if (project.status == ProjectStatus.finalizado) {
      project.status = ProjectStatus.em_andamento;
    } else {
      project.status = ProjectStatus.finalizado;
    }
    await _projectService.update(project);
    updateProject(project);
  }
}
