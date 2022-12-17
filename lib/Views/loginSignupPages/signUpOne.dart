import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/signUpTwo.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboardPage/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';


class SignUpOne extends StatelessWidget {
  const SignUpOne({Key? key}) : super(key: key);

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
                    Text("Just a little more info about you",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 30,
                    ),
                    CoolTextField(prompText: "First Name"),
                    CoolTextField(prompText: "Last Name"),
                    CoolTextField(prompText: "Gender"),
                    CoolTextField(prompText: "Your Birthday"),

                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpTwo()));
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
