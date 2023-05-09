import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class mbtiButton extends StatelessWidget{
  final text;
  final explain;
  final mbti;
  final bool selected;
  final String step;
  final VoidCallback onPressed;

  const mbtiButton({
    Key? key,
    required this.text,
    required this.explain,
    required this.mbti,
    required this.selected,
    required this.step,
    required this.onPressed
  }) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 0,right: 0, top: 0, bottom: 0),
     // width: MediaQuery.of(context).size.width * 0.4,
      width: (MediaQuery.of(context).size.height * 0.34)* 0.668,
      height: MediaQuery.of(context).size.height * 0.34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25), // 10은 모서리 반경 값입니다.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child:NeumorphicButton(
        style: NeumorphicStyle(
          color: selected? Color(0xff7898FF):Colors.white,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
          shadowDarkColorEmboss: Color(0xff7898FF).withOpacity(0.5),
          intensity: 10,
          //surfaceIntensity: 30,
          depth: -5, // depth 값이 음수이면 Inner Shadow 효과가 적용
          lightSource: LightSource.bottomRight,
        ), onPressed: onPressed,
        child: Container(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    selected? SvgPicture.asset(
                        'assets/icon/icon_check.svg',
                        width: MediaQuery.of(context).size.width * 0.077,
                        color: Colors.white)
                        : SvgPicture.asset(
                      'assets/icon/icon_emptycheck.svg',
                      width : MediaQuery.of(context).size.width * 0.077,
                      // color : Color(0xffFFF2a2)
                    ),

                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  ],
                ),
                //SizedBox(height: MediaQuery.of(context).size.height * 0.002),
                Center(
                  child: Column(
                    children: [
                      Text(text, textAlign: TextAlign.center,style: TextStyle(
                          color: selected ? Colors.white: Colors.black,
                          fontSize: 15, fontWeight: FontWeight.bold),),
                      Text(explain,textAlign: TextAlign.center,style: TextStyle(
                          color: selected ? Colors.white: Colors.black,
                          fontSize: 13),),
                      Container(
                        width: 60,height: 60,
                        decoration: BoxDecoration(shape: BoxShape.circle,
                            color: selected? Color(0xffFFB5B5): Colors.grey),
                      ),
                      Text(mbti, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                          color:selected? Colors.white : Colors.black ),),
                    ],
                  ),
                ),

              ]
          ),

        ),
      ) ,
/*
      margin: EdgeInsets.only(left: 0,right: 0, top: 0, bottom: 0),
      child: MaterialButton(
        minWidth: (MediaQuery.of(context).size.height * 0.294)* 2/3,
        height: MediaQuery.of(context).size.height * 0.294,
        elevation: 3.0,
        highlightElevation: 1.0,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          //side: BorderSide(color: Color(0xff7898FF))
        ),
        color: selected? Color(0xff7898FF):Colors.white,
        textColor: Colors.black,

        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  selected? SvgPicture.asset(
                      'assets/icon/icon_check.svg',
                      width: MediaQuery.of(context).size.width * 0.077,
                      color: Colors.white)
                      : SvgPicture.asset(
                    'assets/icon/icon_emptycheck.svg',
                    width : MediaQuery.of(context).size.width * 0.077,
                   // color : Color(0xffFFF2a2)
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.245),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Text(text, textAlign: TextAlign.center,style: TextStyle(
                        color: selected ? Colors.white: Colors.black,
                        fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(explain,textAlign: TextAlign.center,style: TextStyle(
                        color: selected ? Colors.white: Colors.black,
                        fontSize: 13),),
                    Container(
                      width: 60,height: 60,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                          color: selected? Color(0xffFFB5B5): Colors.grey),
                    ),
                    Text(mbti, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                        color:selected? Colors.white : Colors.black ),),
                  ],
                ),
              ),

            ]
        ),

      ),*/
    );

  }

}



