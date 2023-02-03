import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:friendship/model/auth_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier{

  static final storage = FlutterSecureStorage();

  Future<void> login(Auth auth, BuildContext context) async {
    const url = 'https://410affb5-4f61-41b1-8858-a1870887f995.mock.pstmn.io/auth';  //mocksever

    var response = await http.post(Uri.parse(url),
      body: jsonEncode({
        "email": auth.password,
        "password": auth.password,
      }));

    //success
    if(response.statusCode == 200){
      print(json.decode(response.body));
      //토큰 저장
      await storage.write(
        key: 'token',
        value: response.body,
      );
      print('로그인 성공');

      //화면 이동
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route)=>false);

    //fail
    } else {
      print(response.body);
    }
  }
}