import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication_bloc.dart';
import '../widgets/input/primary_button.dart';
import '../shared/theme.dart';
import '../widgets/container/page_container.dart';
import '../widgets/input/primary_text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthenticationState _stateWatch = context.watch<AuthenticationBloc>().state;
    String? email;
    String? pass;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoggedIn) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      child: PageContainer(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello",
                style: textWhite.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome to the Scratch App",
                style: textWhite,
              ),
              if (_stateWatch is AuthenticationSuccess ||
                  _stateWatch is AuthenticationError)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Text(
                    _stateWatch.message!,
                    style: (_stateWatch is AuthenticationSuccess)
                        ? textGreen
                        : textRed,
                  ),
                ),
              const SizedBox(height: 15),
              PrimaryTextInput(
                label: "Email",
                valueSetter: (val) {
                  email = val;
                },
              ),
              PrimaryTextInput(
                label: "Password",
                obscureText: true,
                valueSetter: (val) {
                  pass = val;
                },
              ),
              PrimaryButton(
                child: (_stateWatch is AuthenticationLoading)
                    ? const CircularProgressIndicator(
                        strokeWidth: 4.0,
                        color: Colors.white,
                      )
                    : Text("Register", style: textWhite),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<AuthenticationBloc>().add(AuthenticationLogin(
                          email: email!,
                          password: pass!,
                        ));
                  }
                },
              ),
              Container(
                height: 2.0,
                width: double.infinity,
                color: Colors.white,
                margin: const EdgeInsets.all(24.0),
              ),
              Center(
                child: Column(
                  children: [
                    Text("Belum punya akun?", style: textWhite),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text(
                        "Daftar disini",
                        style: textWhite.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
