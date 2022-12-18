import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/SearchedUsers.dart';
//
// class InterestsPage extends StatefulWidget {
//   const InterestsPage({Key? key}) : super(key: key);
//
//   @override
//   State<InterestsPage> createState() => _InterestsPageState();
// }
//
// class _InterestsPageState extends State<InterestsPage> {
//   bool val = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Interests"),
//       ),
//       body: ListView(children: const [
//         , "Cricket"
//         , "Football"
//         , "Technology"
//         , "Art"
//         , "Religion"
//         , "Science"
//         , "Movies"
//         , "TV"
//         , "Novels"
//         , "Self Help"
//         , "Gaming"
//         , "History"
//         , "Physics"
//         , "Formula One"
//         , "Bingo"
//         , "Cooking"
//         , "Pets"
//         , "Gardening"
//         , "Kids"
//         , "Teddy Bears"
//         , "Rats"
//         , "Animals"
//       ],),
//     );
//   }
// }
//
// class CheckTile extends StatefulWidget {
//   final String text;
//   const CheckTile({Key? key, required this.text}) : super(key: key);
//
//   @override
//   State<CheckTile> createState() => _CheckTileState();
// }
//
// class _CheckTileState extends State<CheckTile> {
//   bool val = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       title: Text(widget.text),
//       value: val,
//       onChanged: (bool? value) {
//         setState(() {
//           val = !val;
//         });
//       },
//     );
//   }
// }


class InterestsPage extends StatefulWidget {
  const InterestsPage({Key? key}) : super(key: key);

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}
class _InterestsPageState extends State<InterestsPage> {
  final List<String> array1 = ["Cricket"
        , "Football"
        , "Technology"
        , "Art"
        , "Religion"
        , "Science"
        , "Movies"
        , "TV"
        , "Novels"
        , "Self Help"
        , "Gaming"
        , "History"
        , "Physics"
        , "Formula One"
        , "Bingo"
        , "Cooking"
        , "Pets"
        , "Gardening"
        , "Kids"
        , "Teddy Bears"
        , "Rats"
        , "Animals"];

  late  List<String> array2 = ['item 2', 'item 3', 'item 4'];
  final Map<String, bool> selectedElements = {};


  @override
  void initState() {
    super.initState();

  }

  void rec(){
    for (var element in array1) {
      if (array2.contains(element)) {
        selectedElements[element] = true;
      } else {
        selectedElements[element] = false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final searchedUsers = context.watch<SearchedUsers>();
    array2=searchedUsers.interests;
  rec();
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: array1.length,
          itemBuilder: (context, index) {
            final element = array1[index];
            return CheckboxListTile(
              title: Text(element),
              value: selectedElements[element],
              onChanged: (value) {

                setState(() {
                  selectedElements[element] = value!;
                  if(value==true){ searchedUsers.interests.add(element);}
                });
              },
            );
          },
        ),
      ),
    );
  }
}