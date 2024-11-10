import 'package:equatable/equatable.dart';
import 'package:job_timer/models/constants/project_constants.dart';
import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/entities/project_task.dart';

class Project extends Equatable {
  final String? uid;
  final String name;
  final ProjectStatus status;
  final List<ProjectTask>? tasks;
  final int estimate;
  const Project({
    this.uid,
    required this.name,
    required this.status,
    required this.estimate,
    this.tasks,
  });

  @override
  List<Object?> get props => [uid, name, status, tasks, estimate];

  factory Project.fromMap({
    required Map<String, dynamic> map,
    required String uid,
  }) {
    return Project(
      uid: uid,
      name: map[ProjectConstants.NAME],
      status: ProjectStatus.values[map[ProjectConstants.STATUS]],
      estimate: map[ProjectConstants.ESTIMATE],
      tasks: map[ProjectConstants.TASKS]
          .map<ProjectTask>((task) => ProjectTask.fromMap(
                map: task,
              ))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    ProjectTask task = ProjectTask(
      name: 'Task 1',
      duration: 10,
      created: DateTime.now(),
    );

    return {
      ProjectConstants.NAME: name,
      ProjectConstants.STATUS: status.index,
      ProjectConstants.ESTIMATE: estimate,
      ProjectConstants.TASKS: tasks == null
          ? [
              task.toMap(),
              task.toMap(),
            ]
          : tasks?.map((task) => task.toMap()).toList(),
    };
  }
}
