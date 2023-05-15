import 'package:aliens/views/pages/loading_page.dart';
import 'package:aliens/views/pages/login/login_checkmail_page.dart';
import 'package:aliens/views/pages/login/login_findpassword_page.dart';
import 'package:aliens/views/pages/login/login_page.dart';
import 'package:aliens/views/pages/matching/matching_partner_info_page.dart';
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

import 'package:aliens/views/pages/signup/signup_name.dart';


import 'package:provider/provider.dart';
import './views/pages/matching/matching_apply_page.dart';
import './views/pages/matching/matching_state_page.dart';
import './views/pages/matching/matching_choose_page.dart';
import './views/pages/matching/matching_apply_done_page.dart';
import './views/pages/matching/matching_done_page.dart';
import './views/pages/matching/matching_info_page.dart';
import './views/pages/matching/matching_edit_page.dart';

import './views/pages/home_page.dart';

import './views/pages/setting/setting_edit_page.dart';
import './views/pages/setting/setting_notification_page.dart';
import './views/pages/setting/setting_terms_page.dart';
import './views/pages/setting/setting_security_page.dart';
import './views/pages/setting/setting_delete_page.dart';
import './views/pages/setting/setting_delete_done_page.dart';
import './views/pages/setting/setting_edit_PW_done_page.dart';
import './views/pages/setting/setting_edit_PW_page.dart';
import './views/pages/setting/setting_find_PW_page.dart';

import './views/pages/chatting/chatting_page.dart';
import './views/pages/splash_page.dart';

import './providers/member_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(fontFamily: 'NotoSans'),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {


        //'/' : (context)=> StartPage(),
        '/' : (context)=> ChangeNotifierProvider(create: (context) => MemberProvider(), child: StartPage()),

        //'/main' : (context)=> ChangeNotifierProvider(create: (context) => MemberProvider(), child: HomePage()),
        '/main': (context)=> HomePage(),

        '/splash': (context)=> SplashPage(),

        // matching
        '/apply' : (context) => MatchingApplyPage(),
        '/done' : (context) => MatchingDonePage(),
        '/state' : (context) => MatchingStatePage(),
        '/choose' : (context) => MatchingChoosePage(),
        '/apply/done' : (context) => MatchingApplyDonePage(),
        '/info/my' : (conext) => MatchingInfoPage(),
        '/info/your' : (context) => MatchingPartnerInfoPage(),
        '/edit' : (context) => MatchingEditPage(),

        //setting
        '/setting/edit' : (context) => SettingEditPage(),
        '/setting/notification' : (context) => SettingNotificationPage(),
        '/setting/terms': (context) => SettingTermsPage(),
        '/setting/security': (context) => SettingSecurityPage(),
        '/setting/delete' : (context) => SettingDeletePage(),
        '/setting/delete/done': (context) => SettingDeleteDonePage(),
        '/setting/edit/PW' : (context) => SettingEditPWPage(),
        '/setting/edit/PW/done' : (context) => SettingEditPWDonePage(),
        '/setting/edit/find' : (context) => SettingFindPWPage(),

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

        //login
        '/login': (context) => Login(),
        '/login/findpassword' : (context) => LoginFindPassword(),
        '/login/checkemail' : (context)=> LoginCheckMail(),

        //chatting
        '/chatting': (context) => ChattingPage(),

        //loading
        '/loading' : (context)=> ChangeNotifierProvider(create: (context) => MemberProvider(), child: LoadingPage()),


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
      appBar: AppBar(
        title: Text('4aliens'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
