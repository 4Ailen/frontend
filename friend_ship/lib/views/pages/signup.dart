import 'dart:convert';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController NameController = new TextEditingController();
  final TextEditingController _BirthdayController = new TextEditingController();
  DateTime? tempPickedDate;
  DateTime _selectedDate = DateTime.now();

  final _GenderList = ['남성', '여성'];
  var _selectedGender;
  final _NationalityList = ['대한민국', '일본', '미국', '중국'];
  var _selectedNationality;

  final TextEditingController MbtiController = new TextEditingController();

  //사진

  final TextEditingController EmailController = new TextEditingController();
  final TextEditingController PasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: NameController,
                  decoration: InputDecoration(
                    hintText: 'name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                DropdownButton(
                    hint: Text('성별') ,
                    items: _GenderList.map((value){
                      return DropdownMenuItem(child: Text(value), value: value);
                    }).toList(),
                    value: _selectedGender,
                    onChanged: (value){
                      print(value);
                      setState(() {
                        _selectedGender = value;
                      });
                    }),
                DropdownButton(
                    hint: Text('국적') ,
                    items: _NationalityList.map((value){
                      return DropdownMenuItem(child: Text(value), value: value);
                    }).toList(),
                    value: _selectedNationality,
                    onChanged: (value){
                      print(value);
                      setState(() {
                        _selectedNationality = value;
                      });
                    }),
                TextField(
                  controller: MbtiController,
                  decoration: InputDecoration(
                    hintText: 'MBTI',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                TextField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                TextField(
                  controller: PasswordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}