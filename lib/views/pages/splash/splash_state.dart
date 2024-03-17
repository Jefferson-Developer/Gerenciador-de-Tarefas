import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashState extends ChangeNotifier {

  SplashState() {
    _listinnerUser();
  }

  void _listinnerUser() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          Modular.to.navigate('/login/');
        } else {
          Modular.to.navigate('/home/');
        }
      },
    );
  }
}
