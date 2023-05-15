
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget matchingChattingWidget(BuildContext context, partners) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffF5F7FF),
    ),
    child: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            chatList(context, partners['partners'][0], '마지막 메세지', '22:20pm'),
            chatList(context, partners['partners'][1], '안녕하세요.', '22:20pm'),
            chatList(context, partners['partners'][2], 'Hello! what is your major?', '22:20pm'),
            chatList(context, partners['partners'][3], '어떤 과목을 전공하고 계신가요?', '22:20pm'),
          ],
        ),
      ],
    ),
  );
}
Widget chatList(context, partner, lastMassage, time){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: MaterialButton(
      minWidth: 350,
      height: 77,
      padding: EdgeInsets.symmetric(horizontal: 12),
      elevation: 0.0,
      onPressed: () {
        print(partner);
        Navigator.pushNamed(context, '/chatting', arguments: partner);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      color: Colors.white,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icon/icon_profile.svg',
              height: 45,
              color: Color(0xff7898ff),
            ),
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(partner['name'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff888888),
                      ),)
                  ],
                ),
                SizedBox(height: 8),
                Text(lastMassage,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffA4A4A4),
                  ),),
              ],
            ),
          )),
        ],
      ),
    ),
  );
}