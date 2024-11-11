import 'package:flutter/cupertino.dart';
import 'package:job_timer/controllers/services/firebase/auth/auth_service.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/models/project_model.dart';

class HomeState extends ChangeNotifier {
  final ProjectServiceImpl _projectService;
  final AuthService _authService;
  HomeState({
    required ProjectServiceImpl projectService,
    required AuthService authService,
  })  : _projectService = projectService,
        _authService = authService;
  final status = ValueNotifier<ProjectStatus>(ProjectStatus.em_andamento);

  final isLoadingNotifier = ValueNotifier<bool>(false);
  List<ProjectModel> projects = [];
  String? errorMessage;

  Future<void> initState() async {
    status.addListener(() {
      getProjects();
    });
    getProjects();
  }

  Future<void> getProjects() async {
    try {
      isLoadingNotifier.value = true;
      projects = await _projectService.findByStatus(status.value);
      isLoadingNotifier.value = false;
    } catch (e) {
      errorMessage = 'Erro ao buscar projetos';
      isLoadingNotifier.value = false;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  } 
}
