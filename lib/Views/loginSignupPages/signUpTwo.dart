import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/slotsScreen.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboardPage/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';

import '../myProfile/InterestsPage.dart';


class SignUpTwo extends StatelessWidget {
  const SignUpTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text("Ready to make new friends? Need a little more info for that",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 30,
                    ),
                    CoolTextField(prompText: "Your Program"),
                    CoolTextField(prompText: "Year of Study"),
                    CoolTextField(prompText: "Your MB Personality"),
                    InkWell(
                        child: Text(
                          "Follow this link to find your MBTI personality",style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic,decoration: TextDecoration.underline),),
                        onTap: () => launch(
                            'https://www.16personalities.com/free-personality-test')),
                    SizedBox(height: 20,),
                    BigButton(text: "Add Interests", fun: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InterestsPage()));
                    },color: Colors.amber,textColor: Colors.indigo.shade900,size: Size(150,50),),
                    SizedBox(height: 20,),
                    BigButton(text: "Add Schedule", fun: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SlotsSelectorScreen()));
                    },color: Colors.amber,textColor: Colors.indigo.shade900,size: Size(150,50),),

                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DashboardHome()));
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Colors.indigo.shade700,
                          shadowColor: Colors.indigo.shade300),
                      child: Text(
                        "NEXT",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
