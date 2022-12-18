import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/signUpOne.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboardPage/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool _emailInputValidator(String value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (!_emailRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool _passwordInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length <= 6) {
      return false;
    }
    return true;
  }

  var emailcontroller = new TextEditingController();
  var passwcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailcontroller..text = "asd";
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(55.0),
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
                    TextField(controller: emailcontroller,enableSuggestions: false, autocorrect: false, decoration: InputDecoration(labelText: "Email", enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.indigo.shade100), borderRadius: BorderRadius.circular(15),), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.indigo), borderRadius: BorderRadius.circular(15),)),),
                    SizedBox(height: 15),
                    TextField(controller: passwcontroller,obscureText: true, enableSuggestions: false, autocorrect: false, decoration: InputDecoration(labelText: "Password", enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.indigo.shade100), borderRadius: BorderRadius.circular(15),), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.indigo), borderRadius: BorderRadius.circular(15),)),),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpOne(username: emailcontroller.text,password: passwcontroller.text,)));},
                      style: ElevatedButton.styleFrom(minimumSize: Size(200, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),), backgroundColor: Colors.indigo.shade700, shadowColor: Colors.indigo.shade300),
                      child: Text("SIGN UP", style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 20),
                    InkWell(
                      splashColor: Colors.amber,
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
