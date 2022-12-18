


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/SearchedUsers.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final searchedUsers = context.watch<SearchedUsers>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome "+searchedUsers.tusername,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),

            Icon(Icons.explore_outlined,
                color: Colors.indigo, size: 200),

          ],
        ),
      ),
    );
  }
}
