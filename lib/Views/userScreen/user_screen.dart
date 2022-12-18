
import "package:project_phase_one/Widgets/Widgets.dart";
import 'package:flutter/material.dart';
import 'package:project_phase_one/app.dart';
import 'package:project_phase_one/chatScreen/chatScreen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../../Widgets/error_screen.dart';
import '../select_user_screen.dart';

class ProfileScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
    builder: (context) => const ProfileScreen(),
  );
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            Hero(tag: 'hero-profile-picture', child: Avatar.large(url: user?.image),),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(user?.name ?? 'No name'),),
            const Divider(),
            const _SignOutButton(),
            Container(color: Colors.black,),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  Future<void> createChannel(BuildContext context) async {
    final core = StreamChatCore.of(context);
    final channel = core.client.channel('messaging', extraData: {
      'members': [
        core.currentUser!.id,
        user.id,
      ]
    });
    await channel.watch();

    /*Navigator.of(context).push(
      ChatScreen.routeWithChannel(channel),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createChannel(context);
      },
      child: ListTile(
        leading: Avatar.small(url: user.image),
        title: Text(user.name),
      ),
    );
  }
}

class _SignOutButton extends StatefulWidget {
  const _SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  __SignOutButtonState createState() => __SignOutButtonState();
}

class __SignOutButtonState extends State<_SignOutButton> {
  bool _loading = false;

  Future<void> _signOut() async {
    setState(() {
      _loading = true;
    });

    try {
      await StreamChatCore.of(context).client.disconnectUser();

      Navigator.of(context).push(SelectUserScreen.route);
    } on Exception catch (e, st) {
      logger.e('Could not sign out', e, st);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : TextButton(
      onPressed: _signOut,
      child: const Text('Sign out'),
    );
  }
}