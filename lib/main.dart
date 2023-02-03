import 'package:flutter/material.dart';
import 'package:friendship/view/pages/login_page.dart';
import 'package:friendship/view/pages/main_page.dart';

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
      //home: LogIn(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LogIn(),
        '/main': (context) => MainPage(),
      },
    );
  }
}


