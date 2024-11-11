import 'package:job_timer/models/entities/project.dart';
import 'package:job_timer/models/models/project_task_model.dart';
import 'package:job_timer/models/entities/project_status.dart';

class ProjectModel {
  final String? _uid;
  final String name;
  ProjectStatus status;
  final List<ProjectTaskModel> tasks;
  final int estimate;
  ProjectModel({
    String? uid,
    required this.name,
    required this.status,
    this.tasks = const [],
    required this.estimate,
  }) : _uid = uid;

  String? get uid => _uid;

  int get totalTasks =>
      tasks.fold<int>(0, (previusValue, task) => previusValue += task.duration);

  double get percentet {
    if (totalTasks > 0) {
      return totalTasks / estimate;
    }
    return 0;
  }

  factory ProjectModel.fromEntity(Project project) {
    return ProjectModel(
      uid: project.uid,
      name: project.name,
      status: project.status,
      tasks: project.tasks
          .map((task) => ProjectTaskModel.fromEntity(task))
          .toList(),
      estimate: project.estimate,
    );
  }
  
}
