import 'dart:html';
import 'package:friend_ship/models/members.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:friend_ship/models/members.dart';
import 'package:dio/dio.dart';

Future<Members> fetchMembers() async{
  var url = "api url";
  final response = await http.post(
    url,
    body: json.encode({
      var dio = new Dio(),
    }),
  );

  if(response.statusCode == 200){
    print('응답');
    print(json.decode(response.body));
    return Members.fromJson(json.decode(response.body));
  }
  else{
    throw Exception("실패");
  }
}


