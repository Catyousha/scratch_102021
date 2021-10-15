import 'package:firebase_auth/firebase_auth.dart';
import 'package:scratch_102021/firebase_auth_scratch/models/auth_response.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AuthResponse> loginWithEmail(
      {required String email, required String pass}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return AuthResponse(
        user: result.user,
      );
    } catch (e) {
      return AuthResponse(
        message: e.toString(),
      );
    }
  }

  static Future<AuthResponse> registerWithEmail(
      {required String email, required String pass}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return AuthResponse(
        user: result.user,
      );
    } on FirebaseAuthException catch (e) {
      return AuthResponse(
        message: e.message,
      );
    }
  }
}
