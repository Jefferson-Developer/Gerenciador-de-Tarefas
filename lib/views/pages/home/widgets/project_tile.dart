import 'package:flutter/material.dart';
import 'package:job_timer/models/models/project_model.dart';
import 'package:job_timer/views/pages/home/widgets/project_head_widget.dart';
import 'package:job_timer/views/pages/home/widgets/project_progress.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel project;
  const ProjectTile({
    required this.project,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 4,
        ),
      ),
      child: Column(
        children: [
          ProjectHeadWidget(
            project: project,
          ),
          ProjectProgress(
            project: project,
          ),
        ],
      ),
    );
  }
}
