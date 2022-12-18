import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_practice_app/Models/SearchedUsers.dart';
import '../../Widgets/Widgets.dart';

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
      body: ListView(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Icon(Icons.person_outline),
                radius: 25,
              ),
              SizedBox(width: 20),
              Text(
                "To: ${widget.user.username}",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.send),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.amber,
                    shadowColor: Colors.indigo.shade300),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey.shade400,
            indent: 25,
            endIndent: 25,
            thickness: 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: TextFormField(
              decoration: new InputDecoration.collapsed(hintText: 'Write atleast a 1000 character long text'),
              maxLines: null,
              minLines: 30,
              keyboardType: TextInputType.multiline,

            ),
          ),
        ],
      ),
    );
  }
}