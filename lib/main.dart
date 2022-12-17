import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'Views/loginSignupPages/LIorSUscreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Views/select_user_screen.dart';
import 'app.dart';

void main() {
  final client = StreamChatClient(streamKey);
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.client, super.key});

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(child: child!),
        );
      },
      home: const SelectUserScreen()/*const LIorSUscreen()*/,
    );
  }
}
