import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'shared/route_management.dart';
import 'ui/home_page.dart';
import 'ui/login_page.dart';
import 'ui/register_page.dart';

class FirebaseScratchApp extends StatelessWidget {
  const FirebaseScratchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Firebase Auth Scratch App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: RouteManagement.generateRoute,
    );
  }
}
