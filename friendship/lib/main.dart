import 'package:flutter/material.dart';
import 'package:friendship/views/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FriendShip',
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}

