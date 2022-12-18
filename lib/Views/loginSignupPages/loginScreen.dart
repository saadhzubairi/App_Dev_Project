import 'package:flutter/material.dart';
import 'package:firebase_practice_app/Views/loginSignupPages/signUpScreen.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboardPage/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
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
                    Text("SO GLAD TO HAVE YOU BACK!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 30,
                    ),
                    CoolTextField(prompText: "Username",textController: _textController,  ),
                    CoolTextField(
                      prompText: "Password",
                      isPassField: true,
                        textController: _textController
                        ,
                    ),
                    SizedBox(
                      height: 15,
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
                        "LOGIN",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));},

                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Colors.indigo.shade50,
                          shadowColor: Colors.white),
                      child: Text(
                        "SIGN UP",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),

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