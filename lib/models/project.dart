import 'package:equatable/equatable.dart';
import 'package:job_timer/models/constants/project_constants.dart';
import 'package:job_timer/models/project_status.dart';
import 'package:job_timer/models/project_task.dart';

class Project extends Equatable {
  final String? uid;
  final String name;
  final ProjectStatus status;
  final List<ProjectTask>? tasks;

  const Project({
    this.uid,
    required this.name,
    required this.status,
    this.tasks,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        status,
        tasks,
      ];

  factory Project.fromMap({
    required Map<String, dynamic> map,
    required String uid,
  }) {
    return Project(
      uid: uid,
      name: map[ProjectConstants.NAME],
      status: ProjectStatus.values[map[ProjectConstants.STATUS]],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ProjectConstants.NAME: name,
      ProjectConstants.STATUS: status.index,
    };
  }
}
