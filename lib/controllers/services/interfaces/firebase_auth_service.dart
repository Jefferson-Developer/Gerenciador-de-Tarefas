abstract interface class IAuthService {
  Future<void> signIn();
  Future<void> signOut();
}