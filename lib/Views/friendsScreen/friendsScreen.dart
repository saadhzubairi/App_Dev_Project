import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_phase_one/Widgets/Widgets.dart';
import 'package:project_phase_one/Widgets/error_screen.dart';
import 'package:project_phase_one/app.dart';
import 'package:project_phase_one/chatScreen/chatScreen.dart';
import 'package:project_phase_one/helper.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

  final _channelListController =  ChannelListController();
  @override
  Widget build(BuildContext context) {
    return ChannelListCore(
        channelListController: _channelListController,
        emptyBuilder: (context) => const Center(child: Text("Try messaging someone!",textAlign: TextAlign.center,),),
        errorBuilder: (context,error) => DisplayErrorMessage(error: error,),
        loadingBuilder: (context) => const Center(child: SizedBox(height: 100,width: 100,child: CircularProgressIndicator(),),),
        filter: Filter.and([
          Filter.equal('type', 'messaging'),
          Filter.in_('members', [StreamChatCore.of(context).currentUser!.id])
        ]),
        listBuilder: (context, channels){
          return CustomScrollView(
            slivers: [
              SliverList(delegate: SliverChildBuilderDelegate(
                  (context,index){
                    return MessageTile(channel: channels[index]);
                  },
                childCount: channels.length,
              ))
            ],
          );


          /*ListView(
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
          );*/
        }
    );

  }



}

class MessageTile extends StatelessWidget {

  final Channel channel;

  final String? name;
  final String? AvatarUrl;
  final bool? isOnline;
  final String? text;
  final int? lastSeen;

  const MessageTile(
      {Key? key, required this.channel,
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
          Navigator.of(context).push(
            ChatScreen.routeWithChannel(channel),
          );
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
                  Padding(padding: const EdgeInsets.all(12.0), child: Avatar.medium(url: Helpers.getChannelImage(channel, context.currentUser!)),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Helpers.getChannelName(channel, context.currentUser!), style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18),),
                      _buildLastMessage()
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

  Widget _buildLastMessage() {
    return BetterStreamBuilder<int>(
      stream: channel.state!.unreadCountStream,
      initialData: channel.state?.unreadCount ?? 0,
      builder: (context, count) {
        return BetterStreamBuilder(
          stream: channel.state!.lastMessageStream,
          initialData: channel.state!.lastMessage,
          builder: (context, lastMessage) {
            return Text(
              lastMessage.text ?? '',
              overflow: TextOverflow.ellipsis,
              style: (count > 0)
                  ? const TextStyle(
                fontSize: 12,
              )
                  : const TextStyle(
                fontSize: 12,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLastMessageAt() {
    return BetterStreamBuilder<DateTime>(
      stream: channel.lastMessageAtStream,
      initialData: channel.lastMessageAt,
      builder: (context, data) {
        final lastMessageAt = data.toLocal();
        String stringDate;
        final now = DateTime.now();

        final startOfDay = DateTime(now.year, now.month, now.day);

        if (lastMessageAt.millisecondsSinceEpoch >=
            startOfDay.millisecondsSinceEpoch) {
          stringDate = Jiffy(lastMessageAt.toLocal()).jm;
        } else if (lastMessageAt.millisecondsSinceEpoch >=
            startOfDay
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch) {
          stringDate = 'YESTERDAY';
        } else if (startOfDay.difference(lastMessageAt).inDays < 7) {
          stringDate = Jiffy(lastMessageAt.toLocal()).EEEE;
        } else {
          stringDate = Jiffy(lastMessageAt.toLocal()).yMd;
        }
        return Text(
          stringDate,
          style: const TextStyle(
            fontSize: 11,
            letterSpacing: -0.2,
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }

}
