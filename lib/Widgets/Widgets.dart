import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_phase_one/Models/SearchedUsers.dart';
import '../Views/explorePage/exploreUserInfo.dart';
export 'avatar.dart';
export 'icon_buttons.dart';
class CoolTextField extends StatelessWidget {
  String? prompText;
  bool? isPassField;

  CoolTextField({this.prompText, this.isPassField, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        obscureText: isPassField ?? false,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            labelText: prompText ?? '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.indigo.shade100),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.indigo),
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}

class BigButton extends StatelessWidget {
  final String text;
  Color? color;
  VoidCallback fun;
  Size? size;
  Color? textColor;
  BorderRadius? radius;
  double? fontSize;

  BigButton(
      {required this.text,
      this.color,
      this.textColor,
      this.size,
      this.fontSize,
      this.radius,
      required this.fun,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fun,
      style: ElevatedButton.styleFrom(
          minimumSize: size ?? Size(140, 80),
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(25),
          ),
          backgroundColor: color ?? Colors.indigo.shade900,
          shadowColor: Colors.indigo.shade300),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            fontSize: fontSize ?? 20,
            fontWeight: FontWeight.w700,
            color: textColor ?? Colors.white),
      ),
    );
  }
}

class ResultBoxes extends StatelessWidget {
  final SearchedUsers user;
  const ResultBoxes({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const SizedBox(height: 10),
              Text(
                user.username,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w900, fontSize: 17),
              ),
              const SizedBox(height: 10),
              Text(
                "${22}, ${user.year}",
                style: GoogleFonts.roboto(),
              ),
              const SizedBox(height: 2),
              Text(
                "${user.commons} common interests",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.amber.shade800),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ExploreUserInfo(user: user)));
      },
    );
  }
}


