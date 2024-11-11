import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/models/models/project_model.dart';
import 'package:job_timer/models/models/project_task_model.dart';

class TaskState extends ChangeNotifier {
  final ProjectServiceImpl _projectService;
  final ProjectModel _project;
  TaskState({
    required ProjectServiceImpl projectService,
    required ProjectModel project,
  })  : _projectService = projectService,
        _project = project;

  final isLoadingNotifier = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final estimateEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    estimateEC.dispose();
  }

  Future<void> save() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoadingNotifier.value = true;

        _project.tasks.add(
          ProjectTaskModel(
            name: nameEC.text,
            duration: int.parse(estimateEC.text),
          ),
        );

        await _projectService.update(
          _project,
        );
        Modular.to.pop(_project);
      } catch (error) {
        log('Error: $error');
      } finally {
        isLoadingNotifier.value = false;
      }
    }
  }
}
