import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/modules/app_module.dart';
import 'package:job_timer/views/pages/project/detail/project_detail_page.dart';
import 'package:job_timer/views/pages/project/detail/project_detail_state.dart';

class ProjectDetailModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<ProjectDetailState>(
      () => ProjectDetailState(projectService: i.get(), project: i.args.data['project']),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const ProjectDetailPage());
  }
}
