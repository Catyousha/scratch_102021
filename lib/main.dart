import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_auth_scratch/error_app.dart';
import 'firebase_auth_scratch/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(const FirebaseScratchApp());
  } catch (_) {
    runApp(const ErrorApp());
  }
}
