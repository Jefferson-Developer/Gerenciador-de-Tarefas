import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/models/entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.4,
              child: DropdownButtonFormField<ProjectStatus>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                isExpanded: true,
                items: ProjectStatus.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.label,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
                width: constraints.maxWidth * 0.4,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Modular.to.pushNamed('/project/register/');
                  },
                  label: const Text('Novo Projeto'),
                  icon: const Icon(Icons.add),
                )),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
