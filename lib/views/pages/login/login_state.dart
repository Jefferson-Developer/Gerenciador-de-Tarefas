import 'package:flutter/widgets.dart';
import 'package:job_timer/controllers/services/auth_service.dart';

class LoginState extends ChangeNotifier {
  final AuthService _service;

  LoginState({
    required AuthService service,
  }) : _service = service;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  void setLoading({bool? value}) {
    isLoading.value = value ?? !isLoading.value;
    notifyListeners();
  }

  Future<void> signInGoogle() async {
    try {
      setLoading(value: true);
      await _service.signIn();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(value: false);
    }
  }
}
