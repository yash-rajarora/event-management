import 'dart:core';

class UserModel{
  final String name;
  final String location;
  final String dnt;
  final String desc;

  UserModel(this.name,this.location, this.dnt, this.desc);

  Map<String,dynamic> toMap(){
    return{
      'name' : name,
      'location' : location,
      'dnt' : dnt,
      'desc' : desc
    };
  }
}