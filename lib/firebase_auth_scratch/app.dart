import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/home_page.dart';
import 'ui/login_page.dart';

class FirebaseScratchApp extends StatefulWidget {
  const FirebaseScratchApp({Key? key}) : super(key: key);

  @override
  State<FirebaseScratchApp> createState() => _FirebaseScratchAppState();
}

class _FirebaseScratchAppState extends State<FirebaseScratchApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return const MaterialApp(
        title: 'Something wrong',
        home: Scaffold(
          body: Center(child: Text('Something wrong')),
        ),
      );
    }
    if (!_initialized) {
      return const MaterialApp(
        title: 'Loading...',
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return const MaterialApp(
      title: 'Firebase Auth Scratch App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
