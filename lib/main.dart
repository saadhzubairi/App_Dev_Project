import 'package:firebase_practice_app/Models/SearchedUsers.dart';
import 'package:firebase_practice_app/Views/dashboardPage/HomePage.dart';
import 'package:firebase_practice_app/Views/myProfile/myProfilePage.dart';
import 'package:flutter/material.dart';
import 'Views/loginSignupPages/LIorSUscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';





void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchedUsers(tusername: "mujtaba",
            t_bio: "abc"
            , gender: "Male",
            MB_Personality: "AWSOME_13 ", program: "BSCS", year: "2000", age: 22, interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"], commons: 5)),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LIorSUscreen(),
    );
  }
}