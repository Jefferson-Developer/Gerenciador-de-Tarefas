
# Descrição do Pull Request: Implementação de Controle de Autenticação e AppState

Neste pull request, foi introduzido um listener para verificar o status de autenticação do usuário. Caso o usuário não esteja autenticado, a navegação será direcionada para a tela inicial (Home Screen); caso contrário, será direcionado para a tela de login.

Adicionalmente, foi criado o AppState para gerenciar e salvar estados da tela, proporcionando uma abordagem centralizada para a manipulação de estados na aplicação.

Essas implementações visam aprimorar o fluxo de autenticação e fornecer uma estrutura eficiente para o gerenciamento de estados da interface.

## Explicação do Código

O código fornecido é a implementação de um serviço de autenticação com Google usando o Firebase Authentication.

### `signIn()`

- A função `signIn()` utiliza o pacote `google_sign_in` para permitir que o usuário faça login usando sua conta Google.
- Inicialmente, o usuário é solicitado a escolher uma conta Google. O objeto `GoogleSignInAccount` é retornado, representando a conta escolhida.
- Em seguida, a autenticação do Google é realizada através do método `authentication`, que retorna o `accessToken` e o `idToken`.
- Essas credenciais são usadas para criar um objeto `AuthCredential` do Firebase com `GoogleAuthProvider.credential`, que é utilizado para autenticar o usuário com o Firebase.
- Se a autenticação for bem-sucedida, o usuário é logado na aplicação.

### `signOut()`

- A função `signOut()` realiza o logout do usuário tanto do Firebase quanto da conta Google vinculada.
- O método `signOut` do `FirebaseAuth.instance` é chamado para encerrar a sessão do Firebase.
- O método `disconnect()` do `GoogleSignIn` desconecta a conta Google do aplicativo, garantindo que o usuário precisará fornecer credenciais novamente para fazer login.

Essas funções permitem gerenciar o fluxo de autenticação do usuário, tanto para fazer login quanto para fazer logout com segurança.
