import 'package:flutter/cupertino.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/models/project_model.dart';

class HomeState extends ChangeNotifier {
  final ProjectServiceImpl _projectService;

  HomeState({required ProjectServiceImpl projectService})
      : _projectService = projectService;
  final status = ValueNotifier<ProjectStatus>(ProjectStatus.em_andamento);

  final isLoadingNotifier = ValueNotifier<bool>(false);
  List<ProjectModel> projects = [];
  String? errorMessage;

  Future<void> initState() async {
    status.addListener(() {
      _getProjects();
    });
    _getProjects();
  }

  Future<void> _getProjects() async {
    try {
      isLoadingNotifier.value = true;
      projects = await _projectService.findByStatus(status.value);
      isLoadingNotifier.value = false;
    } catch (e) {
      errorMessage = 'Erro ao buscar projetos';
      isLoadingNotifier.value = false;
    }
  }
}
