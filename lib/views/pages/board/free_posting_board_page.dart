import 'dart:async';

import 'package:aliens/mockdatas/board_mockdata.dart';
import 'package:aliens/models/chatRoom_model.dart';
import 'package:aliens/models/screenArgument.dart';
import 'package:aliens/repository/sql_message_database.dart';
import 'package:aliens/views/pages/board/article_page.dart';
import 'package:aliens/views/pages/chatting/chatting_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FreePostingBoardPage extends StatefulWidget {
  const FreePostingBoardPage({super.key});

  @override
  State<StatefulWidget> createState() => _FreePostingBoardPageState();
}

class _FreePostingBoardPageState extends State<FreePostingBoardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('자유게시판'),
          backgroundColor: Color(0xff7898ff),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView.builder(
              itemCount: freePostingBoardList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      //제목
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              'assets/icon/icon_profile.svg',
                              width: 35,
                              color: Color(0xff7898ff),
                            ),
                          ),
                          Text(
                            '${freePostingBoardList[index].member!.nickname}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            '/',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'KR',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),

                      //내용
                      subtitle: Container(
                        padding: EdgeInsets.only(left: 15, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            freePostingBoardList[index].imageUrls == null ?
                            SizedBox():
                            Container(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: freePostingBoardList[index].imageUrls!.length,
                                  itemBuilder: (context, index){
                                    return Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Color(0xfff8f8f8),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Icon(Icons.add_photo_alternate_outlined),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 25.0),
                              child: Text('${freePostingBoardList[index].title}', style: TextStyle(fontSize: 16),),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.thumb_up_alt_sharp,
                                    color: Color(0xffc1c1c1),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4, right: 15),
                                  child: freePostingBoardList[index].likeCount == 0
                                      ? Text('')
                                      : Text(
                                          '${freePostingBoardList[index].likeCount}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.chat_bubble,
                                    color: Color(0xffc1c1c1),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                      '${freePostingBoardList[index].commentCount}'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      //더보기
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '1분 전',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffc1c1c1)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child:
                                Icon(Icons.more_vert, color: Color(0xffc1c1c1)),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ArticlePage(board: freePostingBoardList[index], boardCategory: "자유게시판")),

                        );
                      },
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xffE5EBFF),
                    )
                  ],
                );
              }),
        ));
  }
}
