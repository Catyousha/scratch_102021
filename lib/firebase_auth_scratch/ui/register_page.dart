import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication_bloc.dart';
import '../widgets/input/primary_button.dart';
import '../widgets/input/primary_text_input.dart';
import '../shared/theme.dart';
import '../widgets/container/page_container.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? pass;
  String? confirmPass;

  @override
  Widget build(BuildContext context) {
    AuthenticationState _stateWatch = context.watch<AuthenticationBloc>().state;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: PageContainer(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Register Page",
                style: textWhite.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Daftarkan akun disini",
                style: textWhite,
              ),
              const SizedBox(height: 15),
              if (_stateWatch is AuthenticationError)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Text(
                    _stateWatch.message,
                    style: textRed,
                  ),
                ),
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
              PrimaryTextInput(
                label: "Konfirmasi Password",
                obscureText: true,
                valueSetter: (val) {
                  confirmPass = val;
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
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationRegister(
                          email!,
                          pass!,
                          confirmPass!,
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
                    Text("Sudah punya akun?", style: textWhite),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        "Silahkan login",
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
