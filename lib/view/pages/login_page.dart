import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:friendship/provider/auth_provider.dart';
import 'package:friendship/model/auth_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController EmailController = new  TextEditingController();
  final TextEditingController PasswordController = new  TextEditingController();
  final AuthProvider authProvider = new AuthProvider();
  static final storage = FlutterSecureStorage();

  //storage에 작성할 모델
  final Auth auth = new Auth();
  //storage로부터 읽을 모델
  dynamic userInfo = null;

  @override
  void initState(){
    super.initState();

    //비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  //비동기로 storage 정보 확인
  _asyncMethod() async{
    //auth값 읽어서 userInfo에 저장
    userInfo = await storage.read(key:'auth');

    //user 정보가 있다면 로그인된 것이므로 메인 페이지로 넘어가게 한다.
    if (userInfo != null){
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route)=>false);
    } else {
      print('로그인 필요');  //정보가 없으면 로그인 필요
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('log in test'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                controller: EmailController,
                ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                controller: PasswordController,
                ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  auth.email = EmailController.text;
                  auth.password = PasswordController.text;
                  print("email: ${auth.email}");
                  print("password: ${auth.password}");

                  //로그인 정보 저장
                  await storage.write(
                    key: 'auth',
                    value: jsonEncode(auth),
                  );

                  //http 요청
                  authProvider.login(auth, context);

                },
                child: Text("Log In"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}