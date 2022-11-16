import 'package:flutter/material.dart';

class LIorSUscreen extends StatelessWidget {
  const LIorSUscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage("assets/man_laptop.png")),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(onPressed: () {}, child: const Text("LOG IN")),
            const SizedBox(width: 10),
            ElevatedButton(onPressed: () {}, child: const Text("SIGN UP")),
          ])
        ],
      ),
    ));
  }
}
