import 'package:equatable/equatable.dart';
import 'package:job_timer/models/project_status.dart';
import 'package:job_timer/models/project_task.dart';

class Project extends Equatable {
  final String? uid;
  final String name;
  final ProjectStatus status;
  final List<ProjectTask> tasks;

  const Project({
    this.uid,
    required this.name,
    required this.status,
    required this.tasks,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        status,
        tasks,
      ];
}
