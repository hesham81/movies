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

  static Future<User?> createAccount({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String imageUrl,
  }) async {
    try {
      UserCredential? user = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        user.user!.updateDisplayName(name);
        user.user!.updatePhotoURL(imageUrl);
        // user.user!.updatePhoneNumber(phone as PhoneAuthCredential);
        user.user!.refreshToken;
        return user.user;
      }
    } on FirebaseAuthException catch (e) {
      print("object");
    } catch (error) {
      print("object");
    }
    return null;
  }
}
