import 'dart:developer';

import 'package:job_timer/controllers/exception/failure.dart';
import 'package:job_timer/controllers/database/project_dao.dart';
import 'package:job_timer/models/entities/project.dart';
import 'package:job_timer/models/entities/project_status.dart';

import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDAO _projectDAO;

  ProjectRepositoryImpl({required ProjectDAO projectDAO})
      : _projectDAO = projectDAO;

  @override
  Future<void> register(Project project) async {
    try {
      await _projectDAO.create(
        data: project,
      );
    } catch (e) {
      log('Erro ao criar projeto', error: e, stackTrace: StackTrace.current);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) {
    return _projectDAO.findByStatus(status);
  }

  @override
  Future<void> update(Project project) async {
    try {
      await _projectDAO.update(
        project: project,
      );
    } catch (e) {
      log('Erro ao atualizar projeto', error: e, stackTrace: StackTrace.current);
      throw Failure(message: 'Erro ao atualizar projeto');
    }
  }
}
