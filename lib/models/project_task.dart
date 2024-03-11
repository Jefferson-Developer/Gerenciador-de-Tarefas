import 'package:equatable/equatable.dart';
class ProjectTask extends Equatable{
  final String name;
  final int duration;
  final DateTime created;

  const ProjectTask({
    required this.name,
    required this.duration,
    required this.created,
  });
  
  @override
  List<Object?> get props => [
    name,
    duration,
    created,
  ];
}