import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/home_page.dart';

import 'bloc/startup_bloc.dart';

class FirebaseStoreScratch extends StatelessWidget {
  const FirebaseStoreScratch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firestore Scratch App',
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
        },
      ),
    );
  }
}