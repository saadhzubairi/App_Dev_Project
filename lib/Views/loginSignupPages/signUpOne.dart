import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/signUpTwo.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpOne extends StatefulWidget {
  final String username;
  final String password;


  const SignUpOne({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  State<SignUpOne> createState() => _SignUpOneState();
}

class _SignUpOneState extends State<SignUpOne> {

  var fnameController = new TextEditingController();
  var lnameController = new TextEditingController();
  var gendController = new TextEditingController();
  var dobController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    Text("Just a little more info about you",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(height: 30,),
                    TextField(controller: fnameController,enableSuggestions: false, autocorrect: false, decoration: InputDecoration(labelText: "First Name", enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.indigo.shade100), borderRadius: BorderRadius.circular(15),), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.indigo), borderRadius: BorderRadius.circular(15),)),),
                    SizedBox(height: 20),
                    TextField(controller: lnameController,enableSuggestions: false, autocorrect: false, decoration: InputDecoration(labelText: "Last Name", enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.indigo.shade100), borderRadius: BorderRadius.circular(15),), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.indigo), borderRadius: BorderRadius.circular(15),)),),
                    SizedBox(height: 20),
                    TextField(controller: gendController,enableSuggestions: false, autocorrect: false, decoration: InputDecoration(labelText: "Gender", enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.indigo.shade100), borderRadius: BorderRadius.circular(15),), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.indigo), borderRadius: BorderRadius.circular(15),)),),
                    SizedBox(height: 20),
                    TextField(controller: dobController,enableSuggestions: false, autocorrect: false, decoration: InputDecoration(labelText: "Birthday", enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.indigo.shade100), borderRadius: BorderRadius.circular(15),), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.indigo), borderRadius: BorderRadius.circular(15),)),),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpTwo(
                              useremail: widget.username,
                              password: widget.password,
                              fname: fnameController.text,
                              lname: lnameController.text,
                              gender: gendController.text,
                              bday: dobController.text,)));
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
