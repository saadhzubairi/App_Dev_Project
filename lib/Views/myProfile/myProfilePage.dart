import 'package:firebase_practice_app/Models/SearchedUsers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_practice_app/Views/myProfile/InterestsPage.dart';
import 'package:provider/provider.dart';
import '../../Widgets/Widgets.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController name_textController = TextEditingController();
  TextEditingController bio_textController = TextEditingController();
  TextEditingController mperonsanlity_textController = TextEditingController();
  TextEditingController program_textController = TextEditingController();
  TextEditingController gender_textController = TextEditingController();
  TextEditingController year_textController = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final searchedUsers = context.watch<SearchedUsers>();

    bio_textController.text = searchedUsers.t_bio;
    name_textController.text = searchedUsers.tusername;
    year_textController.text = searchedUsers.year;
    mperonsanlity_textController.text = searchedUsers.MB_Personality;
    program_textController.text = searchedUsers.program;
    gender_textController.text = searchedUsers.gender;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 40,
                  ),
                ),
                CoolTextField(
                    prompText: "name",
                    textController: name_textController,
                   ),

                CoolTextField(
                    prompText: "bio",
                    textController: bio_textController,
                    ),

                Row(
                  children: [
                    SizedBox(
                        width: 157,
                        child: CoolTextField(
                            prompText: "Gender",
                            textController: gender_textController,
                         )),
                    SizedBox(
                        width: 157,
                        child: CoolTextField(
                            prompText: "MB Personality",
                            textController: mperonsanlity_textController,
                            ))
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                        width: 157,
                        child: CoolTextField(
                            prompText: "Program",
                            textController: program_textController,
                          )),
                    SizedBox(
                        width: 157,
                        child: CoolTextField(
                            prompText: "Year",
                            textController: year_textController,
                           ))
                  ],
                ),
                //CoolTextField(prompText: "Date",),

                SizedBox(
                  height: 10,
                ),
                BigButton(
                  text: "Edit Interests",
                  fun: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const InterestsPage()));
                  },
                  color: Colors.amber,
                  textColor: Colors.indigo.shade900,
                  size: Size(70, 50),
                ),
                SizedBox(
                  height: 6,
                ),
                BigButton(
                  text: "Save",
                  fun: () {
                    //   searchedUsers.updateUser("ahmed", "biology is best");

                    searchedUsers.updateUser(
                        name_textController.text.toString(),
                        bio_textController.text.toString(),
                        gender_textController.text.toString(),
                        mperonsanlity_textController.text.toString(),
                        program_textController.text.toString(),
                        year_textController.text.toString());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Info Saved"),
                    ));
                  },
                  size: Size(70, 50),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
