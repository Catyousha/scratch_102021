import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scratch_102021/firebase_auth_scratch/shared/env.dart';
import '../models/auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AuthResponse> authWithEmail({
    required AuthRequest request,
  }) async {
    try {
      late UserCredential result;
      if (request.type == AuthType.login) {
        result = await _auth.signInWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
      } else if (request.type == AuthType.register) {
        result = await _auth.createUserWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
      }
      return AuthResponse(
        user: result.user,
      );
    } on FirebaseAuthException catch (e) {
      return AuthResponse(
        message: e.message,
      );
    } catch (e) {
      return AuthResponse(
        message: "Authentication method not found!",
      );
    }
  }

  static Future<AuthResponse> authWithGoogle() async {
    late UserCredential result;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId: LocalEnv.googleClientId,
      ).signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      result = await FirebaseAuth.instance.signInWithCredential(credential);
      return AuthResponse(
        user: result.user,
      );
    } on FirebaseAuthException catch (e) {
      return AuthResponse(
        message: e.message,
      );
    } catch (e) {
      return AuthResponse(
        message: "Authentication failed or cancelled.",
      );
    }
  }
}
