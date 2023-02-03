import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static final storage = FlutterSecureStorage();
  dynamic userInfo = '';

  logout() async {
    //로그인 정보와 토큰 지우기
    await storage.delete(key: 'auth');
    await storage.delete(key: 'token');
    print('정보 지움');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false);
  }

  checkUserState() async {
    userInfo = await storage.read(key: 'auth');
    if (userInfo == null) {
      print('로그인 페이지로 이동');
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false);// 로그인 페이지로 이동
    } else {
      print('로그인 중');
    }
  }

  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () async {
            logout();
          },
          child: Text("Log out"),
        ),
      ),
    );
  }
}