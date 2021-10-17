import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication_bloc.dart';
import 'shared/route_management.dart';

class FirebaseScratchApp extends StatelessWidget {
  const FirebaseScratchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthenticationBloc()),
      ],
      child: const MaterialApp(
        title: 'Firebase Auth Scratch App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        onGenerateRoute: RouteManagement.generateRoute,
      ),
    );
  }
}
