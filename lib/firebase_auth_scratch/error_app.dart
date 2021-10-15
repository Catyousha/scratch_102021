import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  const ErrorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Something wrong',
      home: Scaffold(
        body: Center(child: Text('Something wrong')),
      ),
    );
  }
}
