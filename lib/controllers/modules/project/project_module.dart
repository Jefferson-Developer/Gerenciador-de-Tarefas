import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/modules/app_module.dart';
import 'package:job_timer/controllers/modules/project/register/project_register_module.dart';

class ProjectModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];
      
  @override
  void routes(RouteManager r) {
    r.module('/register', module: ProjectRegisterModule());
  }
}
