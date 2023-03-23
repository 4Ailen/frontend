import 'package:aliens/views/pages/signup/signup_birthday.dart';
import 'package:aliens/views/pages/signup/signup_email.dart';
import 'package:aliens/views/pages/signup/signup_emailverify.dart';
import 'package:aliens/views/pages/signup/signup_gender.dart';
import 'package:aliens/views/pages/signup/signup_mbti.dart';
import 'package:aliens/views/pages/signup/signup_nationality.dart';
import 'package:aliens/views/pages/signup/signup_password.dart';
import 'package:aliens/views/pages/signup/signup_profile.dart';
import 'package:aliens/views/pages/signup/signup_school.dart';
import 'package:aliens/views/pages/signup/signup_verifyfinish.dart';
import 'package:aliens/views/pages/signup/signup_welcome.dart';
import 'package:aliens/views/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:aliens/views/components/appbar.dart';
import 'package:aliens/views/components/button.dart';
import 'package:aliens/views/pages/signup/signup_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/start',
      routes: {
        '/start' : (context)=> StartPage(),

        //SignUp
        '/name' : (context) => SignUpName(),
        '/birthday': (context) => SignUpBirthday(),
        '/gender' : (context) => SignUpGender(),
        '/nationality' :(context) => SignUpNationality(),
        '/mbti': (context) => SignUpMbti(),
        '/profile': (context) => SignUpProfile(),
        '/school' : (context) => SignUpSchool(),
        '/email': (context) => SignUpEmail(),
        '/verify' : (context) => SignUpVerify(),
        '/finish': (context) => SignUpVerifyFinish(),
        '/password': (context) => SignUpPassword(),
        '/welcome' : (context) => SignUpWelcome(),




      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: 'appbar내용 없으면 공백 ', onPressed: (){}),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(child: Text('안녕'),onPressed: (){Navigator.pop(context);}),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
