import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  BigButton({required this.text, this.color, required this.fun, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fun,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(140, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: color ?? Colors.indigo.shade700,
          shadowColor: Colors.indigo.shade300),
      child: Text(
        text,
        style:
        GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

