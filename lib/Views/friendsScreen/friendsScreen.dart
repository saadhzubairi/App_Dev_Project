import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_phase_one/Widgets/Widgets.dart';
import 'package:project_phase_one/chatScreen/chatScreen.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MessageTile(isOnline: true,text: "hey nigger!"),
        MessageTile(isOnline: true,),
        MessageTile(),
        MessageTile(),
        MessageTile(),
        MessageTile(isOnline: false,),
        MessageTile(),
        MessageTile(),
        MessageTile(),
        MessageTile(),
        MessageTile(),
      ],
    );
  }
}

class MessageTile extends StatelessWidget {
  final String? name;
  final String? AvatarUrl;
  final bool? isOnline;
  final String? text;
  final int? lastSeen;

  const MessageTile(
      {Key? key,
      this.name,
      this.AvatarUrl,
      this.isOnline,
      this.text,
      this.lastSeen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
      child: InkWell(
        splashColor: Colors.indigo,
        onTap: (){

          //TODO: OPEN TEXT MESSAGE!!

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen()));

        },
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(padding: const EdgeInsets.all(12.0), child: Avatar.medium(url: AvatarUrl ?? "https://www.pngitem.com/pimgs/m/219-2193218_avatar-clipart-png-transparent-png.png"),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name ?? "Jared Smith", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18),),
                      text == null
                          ? Text("Last Seen ${lastSeen?? 0} minutes ago", style: const TextStyle(fontStyle: FontStyle.italic),)
                          : Text(text.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isOnline != null
                        ? Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: (isOnline!) ? Colors.green : Colors.amber),height: 20,width: 20,)
                        : Container(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
