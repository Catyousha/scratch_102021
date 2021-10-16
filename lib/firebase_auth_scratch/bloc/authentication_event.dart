part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  final AuthRequest? request;
  const AuthenticationEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class AuthenticationLogin extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationLogin({
    required this.email,
    required this.password,
  }) : super(AuthRequest(
          type: AuthType.login,
          email: email,
          password: password,
        ));

  @override
  List<Object?> get props => [email, password];
}

class AuthenticationRegister extends AuthenticationEvent {
  final String email;
  final String password;
  final String confirmPass;

  AuthenticationRegister(
    this.email,
    this.password,
    this.confirmPass,
  ) : super(AuthRequest(
          type: AuthType.register,
          email: email,
          password: password,
        ));
  @override
  List<Object?> get props => [email, password, confirmPass];
}
