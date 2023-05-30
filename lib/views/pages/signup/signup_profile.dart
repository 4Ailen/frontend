import 'dart:io';

import 'package:aliens/views/components/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/members.dart';
import '../../components/button.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfile extends StatefulWidget{
  const SignUpProfile({super.key});

  @override
  State<SignUpProfile> createState() => _SignUpProfileState();
}

class _SignUpProfileState extends State<SignUpProfile>{

  File? _profileImage;
  final picker = ImagePicker();
  //비동기 처리를 통해 이미지 가져오기
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _profileImage = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }


  Widget build(BuildContext context){
    dynamic member = ModalRoute.of(context)!.settings.arguments;
    final double screenWidth = MediaQuery.of(context).size.height;
    final bool isSmallScreen = screenWidth <= 700;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(appBar: AppBar(), title: '',  backgroundColor: Colors.transparent, infookay: false, infocontent: '',),
      body: Padding(
        padding: EdgeInsets.only(right: 24,left: 24,top: MediaQuery.of(context).size.height * 0.06,bottom: MediaQuery.of(context).size.height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('나의 프로필 이미지를\n선택해 주세요',
              style: TextStyle(fontSize: isSmallScreen?22:24, fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: Stack(
                children: [
                  Container(
                    child:_profileImage == null?
                        Container(
                          child: SvgPicture.asset(
                              'assets/icon/icon_profile.svg',
                            width: MediaQuery.of(context).size.width * 0.33,
                            height: MediaQuery.of(context).size.height * 0.16,
                            color: Color(0xffE3E3E3),
                          ),
                        ) :
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: MediaQuery.of(context).size.height * 0.26,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(_profileImage!)
                            )
                          ),
                        )

                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                      child:
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Color(0xffFFFFFF),
                        onPressed:(){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return SimpleDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                children: [
                                  SimpleDialogOption(
                                    child: Text('사진 찍기',),
                                    onPressed: (){getImage(ImageSource.camera);},
                                  ),
                                  SimpleDialogOption(
                                    child: Text('사진첩에서 가져오기'),
                                    onPressed: (){getImage(ImageSource.gallery);},
                                  ),
                                ],
                              );
                            }
                        );
                      },
                        child: SvgPicture.asset(
                          'assets/icon/icon_album.svg',
                          width: MediaQuery.of(context).size.width * 0.063,
                          height: MediaQuery.of(context).size.height * 0.027,
                        )
                      ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child:Text('프로필 사진을 선택하여\n본인을 나타내주세요\n상대방과 더 가까워질 수 있어요!',
                style: TextStyle(fontSize: isSmallScreen?12:14, color: Color(0xff626262)),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(child: SizedBox()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Button(
                child: Text('완료'),
                onPressed: (){
                  if(_profileImage != null){
                    //member.profileImage = _profileImage!.path.toString();
                    member.profileImage = 'g.jpg';
                    print(member.toJson());
                    Navigator.pushNamed(context,'/email', arguments: member);
                  }
                }),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/email', arguments: member);
                        member.profileImage = '';
                        print(member.toJson());
                },
                child: Text('다음에 변경할래요!',
                  style: TextStyle(decoration: TextDecoration.underline,
                      fontSize: isSmallScreen?12:14,
                      color: Color(0xff626262)),),),
            ),
          ],
        ),
      ),
    );
  }
}