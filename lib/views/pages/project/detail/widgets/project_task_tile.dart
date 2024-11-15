import 'package:flutter/material.dart';
import 'package:job_timer/models/models/project_task_model.dart';

class ProjectTaskTile extends StatelessWidget {
  final ProjectTaskModel task;
  const ProjectTaskTile({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.name),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: 'Duração',
              style: TextStyle(color: Colors.grey),
            ),
            const TextSpan(
              text: '    ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: '${task.duration.toString()}h',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ]))
        ],
      ),
    );
  }
}
