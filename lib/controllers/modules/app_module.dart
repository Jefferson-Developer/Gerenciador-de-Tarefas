import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/database/project_dao.dart';
import 'package:job_timer/controllers/modules/home/home_module.dart';
import 'package:job_timer/controllers/modules/project/project_module.dart';
import 'package:job_timer/controllers/modules/user_modules/login_module.dart';
import 'package:job_timer/controllers/repository/project_repository_impl.dart';
import 'package:job_timer/controllers/services/firebase/auth/auth_service.dart';
import 'package:job_timer/controllers/services/firebase/project/project_service_impl.dart';
import 'package:job_timer/views/pages/splash/splash_page.dart';
import 'package:job_timer/views/pages/splash/splash_state.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<SplashState>(
      () => SplashState(),
    );
    i.addLazySingleton<AuthService>(
      () => AuthService(),
    );
    i.addLazySingleton<ProjectDAO>(
      () => ProjectDAO(),
    );
    i.addLazySingleton<ProjectRepositoryImpl>(
      () => ProjectRepositoryImpl(projectDAO: i.get()),
    );
    i.addLazySingleton<ProjectServiceImpl>(
      () => ProjectServiceImpl(projectRepository: i.get()),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
    r.module('/project', module: ProjectModule());
  }
}
