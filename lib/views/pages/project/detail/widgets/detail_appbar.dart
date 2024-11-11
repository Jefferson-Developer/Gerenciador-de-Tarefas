import 'package:flutter/material.dart';
import 'package:job_timer/models/models/project_model.dart';
import 'package:job_timer/views/pages/project/detail/widgets/new_tasks_component.dart';

class DetailAppbar extends SliverAppBar {
  DetailAppbar( {super.key, required ProjectModel project, required Function updateProject})
      : super(
          expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: Text(project.name),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1.6),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${project.tasks.length} tasks'),
                          NewTasksComponent(project: project, updateProject: updateProject),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
}
