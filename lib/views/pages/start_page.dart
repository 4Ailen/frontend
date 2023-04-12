import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/button.dart';
import '../components/button_big.dart';

class StartPage extends StatefulWidget{
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();

}

class _StartPageState extends State<StartPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: SizedBox(),
            ),
            Expanded(
              flex:5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 100, height: 50,
                      decoration: BoxDecoration(color: Colors.grey),
                        ),
                    Text('FRIEND SHIP',
                      style : TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('내 손안의 외국인 프렌즈',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.022),),
                      ],),),),
              Expanded(
                flex:4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20,left: 20),
                      child: Column(
                        children: [
                          BigButton(onPressed: () {
                            Navigator.pushNamed(context, '/name');},
                              child: Text('시작하기')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('이미 계정이 있나요?', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.019),),
                              TextButton(onPressed: (){
                                Navigator.pushNamed(context, '/login');
                              },
                                  child: Text('로그인',
                                      style: TextStyle(color: Color(0xff000000),
                                      fontSize: MediaQuery.of(context).size.height * 0.019,
                                      fontWeight: FontWeight.bold,
                                      )))
                            ],
                          )

                        ],
                      )

                    )
                  ],
                ),
              ),
          ],

        ),
        
      ) ,
    );
  }

}