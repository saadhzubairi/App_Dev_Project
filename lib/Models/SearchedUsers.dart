import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedUsers extends ChangeNotifier {
  String tusername;
  String t_bio;
  String gender;
  //final DateTime DOB;
  String MB_Personality;
  String program;
  int age;
  String year;
  List<String> interests;
  int commons;

  SearchedUsers({
    required this.tusername,
    required this.t_bio,
    required this.gender,
    //required this.DOB,
    required this.MB_Personality,
    required this.program,
    required this.year,
    required this.age,
    required this.interests,
    required this.commons,
  });

  String get username => tusername;

  void updateUser(
    String newName, String nbio,    String n_gender,    String n_MB_Personality,    String n_program,
     String n_year,  ) {

    tusername = newName;
    t_bio = nbio;
    gender = n_gender;
    MB_Personality =n_MB_Personality;

    program=n_program;
    year = n_year;

    notifyListeners();
  }
}
