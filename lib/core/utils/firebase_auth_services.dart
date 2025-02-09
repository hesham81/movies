import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthServices {
  static final _firebase = FirebaseAuth.instance;

  static Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? user = await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (error) {
      return null;
    }
  }
}
