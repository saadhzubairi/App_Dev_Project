import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_practice_app/Views/explorePage/writeNewText.dart';
import '../../Widgets/Widgets.dart';
import '../../Models/SearchedUsers.dart';

class ExploreUserInfo extends StatelessWidget {
  final SearchedUsers user;

  const ExploreUserInfo({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: ListView(
          children: [Center(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(children: [
                      Column(children: const [CircleAvatar(
                        child: Icon(Icons.person, size: 68,), radius: 50,),
                        SizedBox(height: 25,),
                        Text("🦊", style: TextStyle(fontSize: 38),)],),
                      const SizedBox(width: 20),
                      SizedBox(width: 180, height: 200, child: Text(user.t_bio,overflow: TextOverflow.ellipsis,maxLines: 12,),
                      )
                    ],
                    ),
                    const SizedBox(height: 20),
                    Card(child: Column(children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text("About ${user.username}", style: GoogleFonts.montserrat(fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, fontSize: 20, color: Colors.indigo.shade900),),),
                      Padding(padding: const EdgeInsets.all(10.0), child: Column(children:
                      [
                      //  RowItem(text: "${user.DOB.day}/${user.DOB.month} (${user.age}) ", icon: Icon(Icons.wallet_giftcard, size: 35, color: Colors.amber,)),
                        RowItem(text: "Capricorn", icon: Icon(Icons.star_border, size: 35, color: Colors.amber,)),
                        RowItem(text: "${user.year}", icon: Icon(Icons.book_outlined, size: 35, color: Colors.amber,)),
                        RowItem(text: "Personality: ${user.MB_Personality} ", icon: Icon(Icons.timelapse, size: 35, color: Colors.amber,)),
                        RowItem(text: "Gender: ${user.gender} ", icon: Icon(Icons.person_outline, size: 35, color: Colors.amber,)),
                        SizedBox(height: 15,),
                        Center(child: Wrap(alignment: WrapAlignment.start, spacing: 5, children: user.interests.map((e) => Chipsicles(text: e.toString())).toList()),),
                        SizedBox(height: 15,),
                      ],),),
                    ],
                    ),
                    )
                  ],
                )),
          ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SendText(user: this.user,)));
        },
        backgroundColor: Colors.amber,
        foregroundColor: Colors.indigo.shade900,
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final Icon icon;
  final String text;

  const RowItem({required this.text, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      icon,
      SizedBox(width: 10,),
      Text(text, style: GoogleFonts.montserrat(fontSize: 20),)
    ]);
  }
}

class Chipsicles extends StatelessWidget {
  final String text;
  final bool? common;
  const Chipsicles({Key? key, required this.text, this.common}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      backgroundColor: (common ?? false)? Colors.amber : Colors.grey,
    );
  }
}