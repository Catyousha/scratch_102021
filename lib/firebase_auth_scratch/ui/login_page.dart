import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Form(
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
            const SizedBox(height: 15),
            PrimaryTextInput(
              label: "Email",
              valueSetter: (val) {},
            ),
            PrimaryTextInput(
              label: "Password",
              obscureText: true,
              valueSetter: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}
