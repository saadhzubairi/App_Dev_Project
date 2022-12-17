import 'package:flutter/material.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({Key? key}) : super(key: key);

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interests"),
      ),
      body: ListView(children: const [
        CheckTile(text: "Cricket",),
        CheckTile(text: "Football",),
        CheckTile(text: "Technology",),
        CheckTile(text: "Art",),
        CheckTile(text: "Religion",),
        CheckTile(text: "Science",),
        CheckTile(text: "Movies",),
        CheckTile(text: "TV",),
        CheckTile(text: "Novels",),
        CheckTile(text: "Self Help",),
        CheckTile(text: "Gaming",),
        CheckTile(text: "History",),
        CheckTile(text: "Physics",),
        CheckTile(text: "Formula One",),
        CheckTile(text: "Bingo",),
        CheckTile(text: "Cooking",),
        CheckTile(text: "Pets",),
        CheckTile(text: "Gardening",),
        CheckTile(text: "Kids",),
        CheckTile(text: "Teddy Bears",),
        CheckTile(text: "Rats",),
        CheckTile(text: "Animals",),
      ],),
    );
  }
}

class CheckTile extends StatefulWidget {
  final String text;
  const CheckTile({Key? key, required this.text}) : super(key: key);

  @override
  State<CheckTile> createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.text),
      value: val,
      onChanged: (bool? value) {
        setState(() {
          val = !val;
        });
      },
    );
  }
}



