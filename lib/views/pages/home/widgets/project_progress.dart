import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/models/models/project_model.dart';

class ProjectProgress extends StatelessWidget {
  final ProjectModel project;
  const ProjectProgress({
    required this.project,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: project.percentet,
                backgroundColor: Colors.grey[400],
                color: AppColors.primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${project.estimate}h'),
            )
          ],
        ),
      ),
    );
  }
}
