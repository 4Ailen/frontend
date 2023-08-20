
import 'dart:async';

import 'package:aliens/models/message_model.dart';
import 'package:aliens/views/pages/board/article_writing_page.dart';
import 'package:aliens/views/pages/board/info_article_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/board_model.dart';
import '../pages/board/article_page.dart';
import 'board_dialog_widget.dart';

class InfoArticleWidget extends StatefulWidget {

  InfoArticleWidget({super.key, required this.board, required this.nationCode});

  final Board board;
  final String nationCode;
  @override
  State<StatefulWidget> createState() => _InfoArticleWidgetState();
}
class _InfoArticleWidgetState extends State<InfoArticleWidget>{

  String createdAt = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 20.h),
      child: ListTile(
        //제목
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '${widget.board.title}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xff616161), fontSize: 16.sp),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  DataUtils.getTime(widget.board.createdAt),
                  style: TextStyle(
                      fontSize: 16.sp, color: Color(0xffc1c1c1)),
                ),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (builder){
                      return BoardDialog(context: context,);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w, top: 0.h),
                    child:
                    Icon(Icons.more_vert, color: Color(0xffc1c1c1)),
                  ),
                )
              ],
            )
          ],
        ),

        //내용
        subtitle: Container(
          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: Icon(
                      Icons.thumb_up_alt_sharp,
                      color: Color(0xffc1c1c1),
                      size: 20.r,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, right: 15).w,
                    child: widget.board.likeCount == 0
                        ? Text('')
                        : Text(
                        '${widget.board.likeCount}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: Icon(
                      Icons.chat_bubble,
                      color: Color(0xffc1c1c1),
                      size: 20.r,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: Text(
                        '${widget.board.commentCount}'),
                  ),
                ],
              )
            ],
          ),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoArticlePage(board: widget.board)),
          );
        },
      ),
    );
  }
}