import 'package:flutter/cupertino.dart';
import 'package:job_timer/controllers/services/firebase/database/project_services.dart';
import 'package:job_timer/models/project.dart';
import 'package:job_timer/models/project_status.dart';

class HomeState extends ChangeNotifier {
  final ProjectServices _projectService;

  HomeState({
    required ProjectServices projectService,
  }) : _projectService = projectService;

  void createTask() async {
    await _projectService.create(
        data: const Project(
      name: 'Projeto 1',
      status: ProjectStatus.em_andamento,
      tasks: [],
    ));
  }
}
