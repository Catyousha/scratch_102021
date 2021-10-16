import 'package:firebase_auth/firebase_auth.dart';

enum AuthType {
  login,
  register,
}

class AuthRequest {
  AuthType type;
  String email;
  String password;

  AuthRequest({
    required this.type,
    required this.email,
    required this.password,
  });
}

class AuthResponse {
  User? user;
  String? message;
  AuthResponse({this.user, this.message});
}
