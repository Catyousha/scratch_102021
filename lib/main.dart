import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_store_scratch/app.dart';
import 'firebase_auth_scratch/error_app.dart';
import 'firebase_auth_scratch/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(const FirebaseStoreScratch());
  }).catchError((_) {
    runApp(const ErrorApp());
  });
}
