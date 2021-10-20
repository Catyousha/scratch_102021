import 'package:flutter/material.dart';
import 'package:scratch_102021/firebase_auth_scratch/ui/home_page.dart';

class FirebaseStoreScratch extends StatelessWidget {
  const FirebaseStoreScratch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore Scratch App',
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}