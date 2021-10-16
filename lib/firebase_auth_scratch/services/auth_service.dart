import 'package:firebase_auth/firebase_auth.dart';
import '../models/auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AuthResponse> loginWithEmail({
    required AuthRequest request,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
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

  static Future<AuthResponse> registerWithEmail({
    required AuthRequest request,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
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
