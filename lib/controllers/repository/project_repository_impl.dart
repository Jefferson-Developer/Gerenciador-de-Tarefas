import 'dart:developer';

import 'package:job_timer/controllers/exception/failure.dart';
import 'package:job_timer/controllers/database/project_dao.dart';
import 'package:job_timer/models/entities/project.dart';

import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDAO _projectServices;

  ProjectRepositoryImpl({required ProjectDAO projectDAO})
      : _projectServices = projectDAO;

  @override
  Future<void> register(Project project) async {
    try {
      await _projectServices.create(
        data: project,
      );
    } catch (e) {
      log('Erro ao criar projeto', error: e, stackTrace: StackTrace.current);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }
}
