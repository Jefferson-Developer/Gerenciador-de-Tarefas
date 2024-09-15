
# Descrição do Pull Request: Implementação de Validação no Método de Login

Neste pull request, foi implementada uma validação no método de login.

## Mensagens de Erro para o Usuário

Foi adicionado um sistema de mensagens de erro que exibe informações relevantes ao usuário em caso de falha na autenticação. Essas alterações visam melhorar a usabilidade da aplicação, proporcionando respostas claras e amigáveis em situações de erro durante o processo de login.

## Explicação do Código

### Trecho Alterado

```dart
import 'dart:developer';
import 'package:asuka/asuka.dart';
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
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      AsukaSnackbar.alert("Erro ao realizar login").show();
      rethrow;
    } finally {
      setLoading(value: false);
    }
  }
}
```

### Alterações:

1. **Captura de Erros**:
   - Agora o `catch` captura tanto o erro (`e`) quanto a stack trace (`s`) para fins de logging.
   - O método `log` do Dart é utilizado para registrar o erro e a stack trace, facilitando a depuração.

2. **Mensagem de Erro para o Usuário**:
   - Foi implementada a exibição de uma mensagem de erro usando `AsukaSnackbar.alert` em caso de falha na autenticação.
   - A mensagem `"Erro ao realizar login"` é exibida ao usuário, proporcionando um feedback claro e imediato sobre o que aconteceu.

3. **Usabilidade Melhorada**:
   - Com essa mudança, o usuário recebe uma resposta direta em caso de falha na autenticação, melhorando a experiência de uso.
