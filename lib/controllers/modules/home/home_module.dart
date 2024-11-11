import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/modules/app_module.dart';
import 'package:job_timer/views/pages/home/home_page.dart';
import 'package:job_timer/views/pages/home/home_state.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

    
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<HomeState>(
      () => HomeState(
        projectService: i.get(),
        authService: i.get(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
