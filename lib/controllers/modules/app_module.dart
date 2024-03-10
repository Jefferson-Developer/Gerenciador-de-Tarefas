import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/modules/home/home_module.dart';
import 'package:job_timer/controllers/modules/user_modules/login_module.dart';
import 'package:job_timer/controllers/services/auth_service.dart';
import 'package:job_timer/views/pages/splash/splash_page.dart';
import 'package:job_timer/views/pages/splash/splash_state.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<SplashState>(
      () => SplashState(),
      config: BindConfig(
        onDispose: (bloc) => bloc.dispose(),
      ),
    );
    i.addSingleton<AuthService>(
      () => AuthService(),
      config: BindConfig(),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
