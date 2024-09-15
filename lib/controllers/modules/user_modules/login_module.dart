import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/services/firebase/auth/auth_service.dart';
import 'package:job_timer/views/pages/login/login_page.dart';
import 'package:job_timer/views/pages/login/login_state.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<AuthService>(
      () => AuthService(),
    );
    i.addLazySingleton<LoginState>(
      () => LoginState(
        service: i.get(),
      ),
      config: BindConfig(),
    );
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const LoginPage());
  }
}
