import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication_bloc.dart';
import '../shared/theme.dart';
import '../widgets/container/page_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    if (context.read<AuthenticationBloc>().state is! AuthenticationLoggedIn) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("/login");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<AuthenticationBloc>().state is! AuthenticationLoggedIn) {
      return const Center(
        child: Text('Forbidden Access. Redirecting you to login page...'),
      );
    }
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is! AuthenticationLoggedIn) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: PageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Home",
              style: textWhite.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "This is your profile",
              style: textWhite,
            ),
            const SizedBox(height: 8),
            Container(
              color: FlexColor.amberLightPrimary,
              padding: const EdgeInsets.all(18),
              child: Text(
                FirebaseAuth.instance.currentUser.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
