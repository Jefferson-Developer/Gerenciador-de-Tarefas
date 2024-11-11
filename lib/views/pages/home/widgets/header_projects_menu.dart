import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/models/entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  ValueNotifier<ProjectStatus> status;
  Function reload;
  HeaderProjectsMenu({
    required this.status,
    required this.reload
  });
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
                value: status.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  isDense: true, // Reduz o espaçamento interno
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Ajuste de padding
                ),
                isExpanded: true,
                items: ProjectStatus.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.label,
                            softWrap: false, // Desativa quebra automática
                            overflow: TextOverflow.ellipsis, // Adiciona "..." se cortar
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  status.value = value!;
                },
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.4,
              child: ElevatedButton.icon(
                onPressed: () async{
                  bool? response = await Modular.to.pushNamed('/project/register/');
                  if(response == true){
                    reload();
                  }
                },
                label: const Text('Novo Projeto'),
                icon: const Icon(Icons.add),
              ),
            ),
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
