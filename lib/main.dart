import 'package:flutter/material.dart';
import 'package:googlefirebase/info.dart';
import 'package:googlefirebase/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseLogin(),
    );
  }
}
