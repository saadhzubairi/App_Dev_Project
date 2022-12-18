import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/slotsScreen.dart';
import '../../Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboardPage/dashboard.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:url_launcher/url_launcher.dart';

import '../myProfile/InterestsPage.dart';

class SignUpTwo extends StatefulWidget {
  final String useremail;
  final String password;
  final String fname;
  final String lname;
  final String gender;
  final String bday;

  const SignUpTwo(
      {Key? key,
      required this.useremail,
      required this.password,
      required this.fname,
      required this.lname,
      required this.gender,
      required this.bday})
      : super(key: key);

  @override
  State<SignUpTwo> createState() => _SignUpTwoState();
}

class _SignUpTwoState extends State<SignUpTwo> {
  final auth = firebase.FirebaseAuth.instance;
  final functions = FirebaseFunctions.instance;

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        // Authenticate with Firebase
        final creds =
            await firebase.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.useremail,
          password: widget.password,
        );
        final user = creds.user;
        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User is empty')),
          );
          return;
        }

        // Set Firebase display name and profile picture
        List<Future<void>> futures = [
          creds.user!.updateDisplayName("${widget.fname} ${widget.lname}"),
        ];

        await Future.wait(futures);

        // Create Stream user and get token using Firebase Functions
        final callable = functions.httpsCallable('createStreamUserAndGetToken');
        final results = await callable();

        // Connect user to Stream and set user data
        final client = StreamChatCore.of(context).client;
        await client.connectUser(
          User(
            id: creds.user!.uid,
            name: "${widget.fname} ${widget.lname}",
            image: "-",
          ),
          results.data,
        );

        // Navigate to home screen
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DashboardHome()));
      } on firebase.FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Auth error')),
        );
      } catch (e, st) {
        print('Sign up error $e $st');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occured')),
        );
      }
      setState(() {
        _loading = false;
      });
    }
  }

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
                    Text(
                        "Ready to make new friends? Need a little more info for that",
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
                          "Follow this link to find your MBTI personality",
                          style: TextStyle(
                              color: Colors.blue,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () => launch(
                            'https://www.16personalities.com/free-personality-test')),
                    SizedBox(
                      height: 20,
                    ),
                    BigButton(
                      text: "Add Interests",
                      fun: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const InterestsPage()));
                      },
                      color: Colors.amber,
                      textColor: Colors.indigo.shade900,
                      size: Size(150, 50),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BigButton(
                      text: "Add Schedule",
                      fun: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SlotsSelectorScreen()));
                      },
                      color: Colors.amber,
                      textColor: Colors.indigo.shade900,
                      size: Size(150, 50),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: _signUp,
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
