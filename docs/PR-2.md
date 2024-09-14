# Descrição do Pull Request: Implementação dos Corpos dos Módulos Home e Login

Neste pull request, foram criados e implementados os corpos dos módulos Home e Login utilizando a biblioteca `flutter_modular`.

## Exemplos de Implementação

### Módulo de Login

```dart
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/views/pages/login/login_page.dart';
import 'package:job_timer/views/pages/login/login_state.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
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
```

O exemplo acima demonstra a implementação de um módulo de login utilizando `flutter_modular`. Nele, o estado do login (`LoginState`) é injetado como uma dependência singleton e uma rota é definida para a página de login (`LoginPage`).

### Módulo de Home (Estrutura Similar)

A estrutura do módulo de Home pode seguir o mesmo padrão, onde suas dependências e rotas são configuradas da mesma forma.
