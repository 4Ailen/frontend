import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //이름
  final TextEditingController NameController = new TextEditingController();
  //생년월일
  final TextEditingController _BirthdayController = new TextEditingController();
  DateTime? tempPickedDate;
  DateTime _selectedDate = DateTime.now();
  //성별
  final _GenderList = ['남성', '여성'];
  var _selectedGender;
  //국적
  final _NationalityList = ['대한민국', '일본', '미국', '중국'];
  var _selectedNationality;
  //mbti
  final TextEditingController MbtiController = new TextEditingController();
  //이미지
  File? _image;
  final picker = ImagePicker();
  //비동기 처리를 통해 이미지 가져오기
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }
  //email
  final TextEditingController EmailController = new TextEditingController();
  //password
  final TextEditingController PasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //이름
                TextField(
                  controller: NameController,
                  decoration: InputDecoration(
                    hintText: 'name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                //날짜
                GestureDetector(
                  onTap: (){
                    HapticFeedback.mediumImpact();
                    _selectDate();
                    },
                  child: Column(
                    children: [
                      Text('생년월일'),
                      TextFormField(
                        enabled: false,
                        controller: _BirthdayController,
                      )
                    ],
                  ),
                ),
                //성별
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
                //국적
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
                //사진
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width /2,
                  child: Center(
                    child: _image == null ? Text('이미지 없음') : Image.file(File(_image!.path)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        getImage(ImageSource.camera);
                        },
                      child: Icon(Icons.add_a_photo),
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        getImage(ImageSource.gallery);
                      },
                      child: Icon(Icons.wallpaper),
                    ),
                  ],
                ),
                //mbti
                TextField(
                  controller: MbtiController,
                  decoration: InputDecoration(
                    hintText: 'MBTI',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                //email
                TextField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                //password
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

  //생년월일 UI 관련코드
 _selectDate() async{
    DateTime? pickedDate =  await showModalBottomSheet<DateTime>(
      context: context,
      builder:  (context){
        return Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        child: Text('취소'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoButton(
                        child: Text('완료'),
                        onPressed: (){
                          Navigator.of(context).pop(tempPickedDate);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Expanded(
                  child: Container(
                    child: CupertinoDatePicker(
                      minimumYear: 1950,
                      maximumYear: DateTime.now().year,
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime dateTime){
                        tempPickedDate = dateTime;
                      },
                    ),
                  ),
                )
              ],
            )
        );
      },
    );
    if(pickedDate != null && pickedDate != _selectedDate){
      setState((){
        _selectedDate = pickedDate;
        _BirthdayController.text = pickedDate.toString();
        convertDateTimeDisplay(_BirthdayController.text);
      });
    }
  }
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    return _BirthdayController.text = serverFormater.format(displayDate);
  }
}




