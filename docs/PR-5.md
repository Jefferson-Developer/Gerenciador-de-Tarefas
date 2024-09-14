
# Opção de Autenticação pelo Google

Implementada a funcionalidade de autenticação, inicialmente restrita ao Google.
Os elementos necessários foram integrados para facilitar o processo de login por meio dessa plataforma.

## Explicação das Classes

### AuthService

A classe `AuthService` implementa a interface `IAuthService` e gerencia o processo de login e logout usando o Firebase Authentication e Google Sign-In.

- **signIn()**:
  - Utiliza o pacote `google_sign_in` para permitir que o usuário faça login usando sua conta Google.
  - O processo envolve o usuário selecionando uma conta Google, e, se bem-sucedido, as credenciais de autenticação do Google são usadas para criar uma `AuthCredential`.
  - A `AuthCredential` é então usada para autenticar o usuário com o Firebase.

- **signOut()**:
  - O método `signOut()` realiza o logout do usuário tanto do Firebase quanto da conta Google vinculada. O Firebase finaliza a sessão e o `GoogleSignIn().disconnect()` desconecta a conta do Google.

### LoginState

A classe `LoginState` gerencia o estado do login no aplicativo.

- **Atributos**:
  - `_service`: instância de `AuthService`, usada para acessar os métodos de autenticação.
  - `_isLoading`: `ValueNotifier<bool>` que indica se o processo de login está em andamento.

- **Métodos**:
  - `setLoading()`: alterna o estado de carregamento, ativando ou desativando o indicador de progresso.
  - `signInGoogle()`: utiliza o método `signIn()` do `AuthService` para realizar o login via Google. O estado de carregamento é atualizado antes e depois da tentativa de login.

Essa classe permite uma interface mais reativa ao login, controlando o estado visual enquanto o processo de autenticação está em andamento.
