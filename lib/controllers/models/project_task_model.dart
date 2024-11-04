class ProjectTaskModel {
  final String? _uid;
  final String name;
  final int duration;

  ProjectTaskModel({
    required this.name,
    required this.duration,
    required uid,
  }) : _uid = uid;

  String? get uid => _uid;
}
