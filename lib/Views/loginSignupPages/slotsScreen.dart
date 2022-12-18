import 'package:flutter/material.dart';
import '../../Widgets/slotsSelector.dart';

class SlotsSelectorScreen extends StatelessWidget {
  const SlotsSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Select busy slots",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: const [
            SlotSelectorWidget(days: "Monday/Wednesday"),
            SlotSelectorWidget(days: "Tuesday/Thursday"),
            SlotSelectorWidget(days: "Friday/Saturday"),
          ],
        ));
  }
}