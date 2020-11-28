import 'package:firebase_auth/firebase_auth.dart' as auth;

class Auth {
  final _auth = auth.FirebaseAuth.instance;
  Future<auth.UserCredential> signUp(String email, String password) async {
    final _authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future<auth.UserCredential> signIn(String email, String password) async {
    final _authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
