import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/modules/app_module.dart';
import 'package:job_timer/views/pages/project/task/task_page.dart';
import 'package:job_timer/views/pages/project/task/task_state.dart';

class TaskModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<TaskState>(
      () => TaskState(projectService: i.get(), project: i.args.data['project']),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const TaskPage());
  }
}
