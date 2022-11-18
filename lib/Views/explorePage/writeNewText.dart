import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_phase_one/Models/SearchedUsers.dart';
import '../Widgets.dart';

class SendText extends StatefulWidget {
  final SearchedUsers user;
  const SendText({Key? key, required this.user}) : super(key: key);

  @override
  State<SendText> createState() => _SendTextState();
}

class _SendTextState extends State<SendText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write new text"),
      ),
      body: ListView(children: [],),
    );
  }
}
