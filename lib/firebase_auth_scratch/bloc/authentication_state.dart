part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final AuthResponse? response;
  final String? message;
  const AuthenticationState(this.response, {this.message});

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
  const AuthenticationSuccess(String message) : super(null, message: message);

  @override
  List<Object?> get props => [message];
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading() : super(null);
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(String message) : super(null, message: message);
}
