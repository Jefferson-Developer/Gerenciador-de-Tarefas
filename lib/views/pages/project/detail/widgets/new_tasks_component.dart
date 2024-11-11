import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/models/models/project_model.dart';

class NewTasksComponent extends StatelessWidget {
  final ProjectModel project;
  final Function updateProject;
  const NewTasksComponent({
    required this.project,
    required this.updateProject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: project.status != ProjectStatus.finalizado,
      replacement: const Text('Projeto finalizado'),
      child: InkWell(
        onTap: () async {
          final project =
              await Modular.to.pushNamed('/project/task/', arguments: {
            'project': this.project,
          });
          if (project != null) {
            updateProject(project);
          } 
        },
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            Text('Adicionar Task')
          ],
        ),
      ),
    );
  }
}
