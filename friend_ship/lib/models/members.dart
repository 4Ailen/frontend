

import 'package:dio/dio.dart';

class Members{
  late String name;
  late String email;
  late String mbti;
  late String gender;
  late String nationality;
  late String birthday;
  late String password;
  late String profileImage;


  Members({
    required this.name,
    required this.email,
    required this.mbti,
    required this.gender,
    required this.nationality,
    required this.birthday,
    required this.password,
    required this.profileImage,
  });
  var formData= FormData.fromMap(
      data['name'] = this.name;
      data['email'] = this.email;
      data['mbti'] = this.mbti;
      data['gender'] = this.gender;
      data['nationality'] = this.nationality;
      data['birthday'] = this.birthday;
      data['password'] = this.password;
      data['profileImage'] = this.profileImage;

      return data;
  );

  factory Members.fromJson(Map<String, dynamic>json){
    return Members(
      name: json["name"],
      email: json["email"],
      mbti: json["mbti"],
      gender: json["gender"],
      nationality: json["nationality"],
      birthday: json["birthday"],
      password: json["password"],
      profileImage: json['profileImage'],
    );
  }
}