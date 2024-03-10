
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/views/pages/home/home_page.dart';

class HomeModule extends Module {


  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }

}