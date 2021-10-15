import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:scratch_102021/firebase_auth_scratch/models/auth_response.dart';
import 'package:scratch_102021/firebase_auth_scratch/services/auth_service.dart';
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
  String? _errorMsg;
  late bool _formInvalid;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return PageContainer(
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
            if (_errorMsg != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Text(_errorMsg!, style: textRed),
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
              child: (_isLoading)
                  ? const CircularProgressIndicator(
                      strokeWidth: 4.0,
                      color: Colors.white,
                    )
                  : Text("Register", style: textWhite),
              onPressed: () async {
                if (_formKey.currentState!.validate() && !_isLoading) {
                  _formKey.currentState!.save();
                  setState(() {
                    _formInvalid = false;
                    _isLoading = true;
                    if (confirmPass != pass) {
                      _errorMsg = "Password konfirmasi tidak sesuai!";
                      _isLoading = false;
                      _formInvalid = true;
                    } else {
                      _errorMsg = null;
                    }
                  });
                  if (!_formInvalid) {
                    await AuthService.registerWithEmail(
                      email: email!,
                      pass: pass!,
                    ).then((response) {
                      if (response.user == null) {
                        setState(() {
                          _errorMsg = response.message;
                          _isLoading = false;
                        });
                      } else {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    });
                  }
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
    );
  }
}
