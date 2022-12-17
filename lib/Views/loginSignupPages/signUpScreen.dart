import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/signUpOne.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboardPage/dashboard.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    Text("We're so happy to have you!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 30,
                    ),
                    CoolTextField(prompText: "Username"),
                    CoolTextField(
                      prompText: "Enter Password",
                      isPassField: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpOne()));
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Colors.indigo.shade700,
                          shadowColor: Colors.indigo.shade300),
                      child: Text(
                        "SIGN UP",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        child: Text("Recover account",
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.indigo))),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(color: Colors.black),
                    SizedBox(
                      height: 30,
                    ),

                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/googlesignin.png"),height: 50), // <-- Use 'Image.asset(...)' here
                          ],
                        ),
                      ),
                    )
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
