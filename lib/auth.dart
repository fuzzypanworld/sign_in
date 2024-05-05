import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    final googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    googleSignIn.signOut();
    final gUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
    print('Gauth $gAuth');
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
