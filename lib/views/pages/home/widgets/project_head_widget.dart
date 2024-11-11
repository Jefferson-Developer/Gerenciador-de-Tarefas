import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/controllers/cores/ui/job_time_icons.dart';
import 'package:job_timer/models/models/project_model.dart';

class ProjectHeadWidget extends StatelessWidget {
  final ProjectModel project;
  const ProjectHeadWidget({
    required this.project,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(project.name),
          const Icon(
            JobTimeIcons.angle_double_right,
            color: AppColors.primaryColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
