import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:project_phase_one/Views/loginSignupPages/LIorSUscreen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../dashboardPage/dashboard.dart';
import '../select_user_screen.dart';


class SplashScreen extends StatefulWidget {
  static Route get route => MaterialPageRoute(
    builder: (context) => const SplashScreen(),
  );
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final StreamSubscription<firebase.User?> listener;

  @override
  void initState() {
    super.initState();
    _handleAuthenticatedState();
  }

  Future<void> _handleAuthenticatedState() async {
    final auth = firebase.FirebaseAuth.instance;
    if (!mounted) {
      return;
    }
    listener = auth.authStateChanges().listen((user) async {
      if (user != null) {
        // get Stream user token
        final callable =
        FirebaseFunctions.instance.httpsCallable('getStreamUserToken');

        final results = await Future.wait([
          callable(),
          // delay to show loading indicator
          Future.delayed(const Duration(milliseconds: 700)),
        ]);

        // connect Stream user
        final client = StreamChatCore.of(context).client;
        await client.connectUser(
          User(id: user.uid),
          results[0]!.data,
        );

        // authenticated
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DashboardHome()));
      } else {
        // delay to show loading indicator
        await Future.delayed(const Duration(milliseconds: 700));
        // not authenticated
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SelectUserScreen()));
      }
    });
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}