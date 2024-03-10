
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/views/pages/login/login_page.dart';

class LoginModule extends Module{
  
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const LoginPage());
  }
}