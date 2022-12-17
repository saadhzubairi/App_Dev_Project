import 'package:flutter/material.dart';

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