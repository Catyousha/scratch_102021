part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final AuthResponse? response;
  const AuthenticationState(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial() : super(null);
}

class AuthenticationLoggedIn extends AuthenticationState {
  const AuthenticationLoggedIn(AuthResponse response) : super(response);
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess(AuthResponse response) : super(response);
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading() : super(null);
}

class AuthenticationError extends AuthenticationState {
  final String message;
  const AuthenticationError(this.message) : super(null);

  @override
  List<Object?> get props => [message];
}
