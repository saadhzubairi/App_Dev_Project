import 'package:flutter/material.dart';
import 'package:firebase_practice_app/Widgets/checkTile.dart';

class SlotSelectorWidget extends StatefulWidget {

  final String days;
  const SlotSelectorWidget({Key? key, required this.days}) : super(key: key);

  @override
  State<SlotSelectorWidget> createState() => _SlotSelectorWidgetState();
}

class _SlotSelectorWidgetState extends State<SlotSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 550,
            width: 540,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.indigo.shade900, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text(
                        widget.days,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Check the slots you are free in")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CheckTile(
                  text: '8:30 - 9:45',
                ),
                CheckTile(
                  text: '10:00 - 11:15',
                ),
                CheckTile(
                  text: '11:30 - 12:45',
                ),
                CheckTile(
                  text: '1:00 - 2:15',
                ),
                CheckTile(
                  text: '2:30 - 3:45',
                ),
                CheckTile(
                  text: '4:00 - 5:15',
                ),
                CheckTile(
                  text: '5:30 - 6:45',
                ),
                CheckTile(
                  text: '7:00 - 8:15',
                ),
              ],
            ),
          ),
        ));
  }
}