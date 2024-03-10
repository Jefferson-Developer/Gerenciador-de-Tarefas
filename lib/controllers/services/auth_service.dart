import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'interfaces/auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<void> signIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
  }
}
