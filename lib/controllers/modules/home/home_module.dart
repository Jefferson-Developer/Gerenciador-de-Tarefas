import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/views/pages/home/home_page.dart';
import 'package:job_timer/views/pages/home/home_state.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton<HomeState>(
      () => HomeState(
      ),
      config: BindConfig(),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
