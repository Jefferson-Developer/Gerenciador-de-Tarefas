import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/modules/app_module.dart';
import 'package:job_timer/views/pages/project/register/project_register_page.dart';
import 'package:job_timer/views/pages/project/register/project_register_state.dart';

class ProjectRegisterModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<ProjectRegisterState>(
      () => ProjectRegisterState(state: i.get()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const ProjectRegisterPage());
  }
}
