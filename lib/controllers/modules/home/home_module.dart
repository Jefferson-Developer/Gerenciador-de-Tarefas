
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/views/pages/home/home_page.dart';

class HomeModule extends Module {

   @override
  void binds(Injector i) {
  }

  @override
  void routes(RouteManager r) {
    ChildRoute('/', child: (context) => const HomePage());
  }

}