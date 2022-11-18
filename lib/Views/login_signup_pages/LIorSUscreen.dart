import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginScreen.dart';
import '../Widgets.dart';

class LIorSUscreen extends StatelessWidget {
  const LIorSUscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        "UNISPHERE",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 38, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Agency over your University life!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 24),
                      ),
                      Image(image: AssetImage("assets/man_laptop.png")),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigButton(
                                text: 'LOGIN',
                                color: Colors.indigo.shade500,
                                fun: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            BigButton(
                                text: 'SIGN UP',
                                color: Colors.indigo.shade900,
                                fun: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                }),
                          ])
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
