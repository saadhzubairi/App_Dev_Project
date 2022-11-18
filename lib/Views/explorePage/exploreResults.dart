import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets.dart';
import '../../Models/SearchedUsers.dart';

class ExploreResults extends StatefulWidget {
  const ExploreResults({Key? key}) : super(key: key);

  @override
  State<ExploreResults> createState() => _ExploreResultsState();
}

class _ExploreResultsState extends State<ExploreResults> {
  List<SearchedUsers> results = [
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
    SearchedUsers(
        username: "jeffrythames",
        bio: "Nulla nisi lorem, interdum at tellus id, viverra commodo erat. Sed feugiat ligula accumsan dolor congue suscipit. Proin egestas mi a porta ultric😂ies. Duis massa qu🐓am, volutpat vitae euismod vitae, ultricies ac tellus. Curabitur venenatis, diam nec pretium egestas, augue dolor euismod justo, nec placerat sem tortor a dolor. Mauris commodo mollis nisi 😜",
        gender: "male",
        DOB: DateTime.utc(2000, 1, 1),
        MB_Personality: "INTP",
        program: "BSCS",
        year: "Sophomore",
        interests: ["Cricket", "Football", "Technology", "Gaming", "Designing"],
        commons: 5,
        age: 22),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matches"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        child: GridView.count(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 0,
          crossAxisCount: 2,
          children: results.map((e) => ResultBoxes(user: e)).toList(),
        ),
      ),
    );
  }
}
