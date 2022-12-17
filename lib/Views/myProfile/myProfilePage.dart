import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/myProfile/InterestsPage.dart';
import '../../Widgets/Widgets.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(child: Icon(Icons.person),radius: 40,),
                ),
                CoolTextField(prompText: "Name",),
                CoolTextField(prompText: "Bio",),
                Row(children: [SizedBox(width: 157,child: CoolTextField(prompText: "Gender",)),SizedBox(width: 157,child: CoolTextField(prompText: "MB Personality",))],),
                Row(children: [SizedBox(width: 157,child: CoolTextField(prompText: "Program",)),SizedBox(width: 157,child: CoolTextField(prompText: "Year",))],),
                CoolTextField(prompText: "Date",),
                SizedBox(height: 10,),
                BigButton(text: "Edit Interests", fun: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InterestsPage()));
                },color: Colors.amber,textColor: Colors.indigo.shade900,size: Size(70,50),),
                SizedBox(height: 6,),
                BigButton(text: "Save", fun: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Info Saved"),
                  ));
                },size: Size(70,50),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
