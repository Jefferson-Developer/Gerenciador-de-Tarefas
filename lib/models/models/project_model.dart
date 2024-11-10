import 'package:job_timer/models/entities/project.dart';
import 'package:job_timer/models/models/project_task_model.dart';
import 'package:job_timer/models/entities/project_status.dart';

class ProjectModel {
  final String? _uid;
  final String name;
  final ProjectStatus status;
  final List<ProjectTaskModel>? tasks;
  final int estimate;
  ProjectModel({
    String? uid,
    required this.name,
    required this.status,
    this.tasks,
    required this.estimate,
  }) : _uid = uid;

  String? get uid => _uid;

  factory ProjectModel.fromEntity(Project project){
    return ProjectModel(
      uid: project.uid,
      name: project.name,
      status: project.status,
      tasks: project.tasks?.map((task) => ProjectTaskModel.fromEntity(task)).toList(),
      estimate: project.estimate,
    );
  }
}
