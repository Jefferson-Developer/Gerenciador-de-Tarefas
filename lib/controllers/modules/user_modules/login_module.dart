
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/views/pages/login/login_page.dart';

class LoginModule extends Module{
  @override
  void binds(Injector i) {
    super.binds(i);
  }
  @override
  void routes(RouteManager r) {
    super.routes(r);
    ChildRoute('/', child: (context) => const LoginPage());
  }
}