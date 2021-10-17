import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import '../models/auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          const AuthenticationInitial(),
        ) {
    on<AuthenticationLogin>(_onLogin);
    on<AuthenticationRegister>(_onRegister);
  }

  Future<void> _onLogin(
    AuthenticationLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationLoading());
    AuthResponse response = await AuthService.authWithEmail(
      request: event.request!,
    );
    (response.user == null)
        ? emit(AuthenticationError(response.message ?? 'Unknown Error'))
        : emit(AuthenticationLoggedIn(response));
  }

  Future<void> _onRegister(
    AuthenticationRegister event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationLoading());
    if (event.password != event.confirmPass) {
      emit(const AuthenticationError("Password konfirmasi tidak sesuai!"));
      return;
    }
    AuthResponse response = await AuthService.authWithEmail(
      request: event.request!,
    );
    (response.user == null)
        ? emit(AuthenticationError(response.message ?? 'Unknown Error'))
        : emit(const AuthenticationSuccess(
            "Registrasi berhasil, silahkan login."));
  }
}
