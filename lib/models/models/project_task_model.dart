import 'package:job_timer/models/entities/project_task.dart';

class ProjectTaskModel {
  final String? _uid;
  final String name;
  final int duration;

  ProjectTaskModel({
    required this.name,
    required this.duration,
    uid,
  }) : _uid = uid;

  String? get uid => _uid;

  factory ProjectTaskModel.fromEntity(ProjectTask task) {
    return ProjectTaskModel(
      uid: task.uid,
      name: task.name,
      duration: task.duration,
    );
  }
  ProjectTask toEntity() {
    return ProjectTask(
      uid: uid,
      name: name,
      duration: duration,
      created: DateTime.now(),
    );
  }
}
