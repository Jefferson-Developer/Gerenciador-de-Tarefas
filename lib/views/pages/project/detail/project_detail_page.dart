import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/job_time_icons.dart';
import 'package:job_timer/controllers/helpers/app_state.dart';
import 'package:job_timer/models/entities/project_status.dart';
import 'package:job_timer/views/pages/project/detail/project_detail_state.dart';
import 'package:job_timer/views/pages/project/detail/widgets/detail_appbar.dart';
import 'package:job_timer/views/pages/project/detail/widgets/project_pie_chart.dart';
import 'package:job_timer/views/pages/project/detail/widgets/project_task_tile.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState
    extends AppState<ProjectDetailPage, ProjectDetailState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: state.projectNotifier,
            builder: (context, project, widget) {
              return CustomScrollView(
                slivers: [
                  DetailAppbar(
                    project: project,
                    updateProject: state.updateProject,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: ProjectPieChart(
                            projectEstimate: project.estimate,
                            totalTasks: project.totalTasks, 
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: project.tasks.length,
                          itemBuilder: (context, index) {
                            return ProjectTaskTile(
                              task: project.tasks[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton.icon(
                            onPressed: () => state.changeStatus(),
                            label:  Text(
                              project.status == ProjectStatus.em_andamento ?  'Finalizar Projeto' : 'Abrir Projeto',
                            ),
                            icon:  Icon(
                               project.status == ProjectStatus.em_andamento ? JobTimeIcons.ok_circled : Icons.open_in_browser,
                            ),
                          ),
                        ),
                      ))
                ],
              );
            }));
  }
}
