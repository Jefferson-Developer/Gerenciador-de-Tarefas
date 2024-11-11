import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/models/models/project_model.dart';
import 'package:job_timer/views/pages/home/widgets/project_head_widget.dart';
import 'package:job_timer/views/pages/home/widgets/project_progress.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel project;
  final Function refresh;
  const ProjectTile({
    required this.project,
    required this.refresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed(
          '/project/datail/',
          arguments: {
            'project': project,
          },
        );

      },
      child: Container(
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
      ),
    );
  }
}
