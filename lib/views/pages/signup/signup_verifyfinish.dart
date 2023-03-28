import 'package:aliens/views/components/appbar.dart';
import 'package:flutter/material.dart';
import '../../../models/members.dart';
import '../../components/button.dart';

class SignUpVerifyFinish extends StatefulWidget{
  const SignUpVerifyFinish({super.key});

  @override
  State<SignUpVerifyFinish> createState() => _SignUpVerifyFinishState();
}

class _SignUpVerifyFinishState extends State<SignUpVerifyFinish>{

  Widget build(BuildContext context){
    //Members members = new Members('','','','','','','','');

    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: '', onPressed: () {},),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            MaterialButton(
              minWidth: 280,
              height: 240,
              //elevation: 3.0,
              //highlightElevation: 1.0,
              onPressed: () {
                Navigator.pushNamed(context, '/password');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Color(0xffffffff),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, size : 86, color: Color(0xff7898FF),),
                  SizedBox(height: 10),
                  Text('인증 완료!', style: TextStyle(fontSize: 24),)
                ],
              ),
            ),
            Expanded(child: SizedBox()),

          ],
        )
      ),
    );
  }
}